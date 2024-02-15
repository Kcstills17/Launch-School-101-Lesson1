ENV["RACK_ENV"] = "test"
require "fileutils"
require "minitest/autorun"
require "rack/test"

require_relative "../cms"



class AppTest < Minitest::Test
  include Rack::Test::Methods


  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)

  end

  def teardown
    FileUtils.rm_rf(data_path)

  end

  def user_exists?(user)
    user_credentials = YAML.load_file(load_user_credentials_path)
    user_credentials.key?(user)
  end

  def delete_test_yaml_account(key)
    credentials_path = load_user_credentials_path
    credentials = load_user_credentials

    # Delete the key from the credentials hash
    credentials.delete(key)

    # Write the updated hash back to the YAML file
    File.open(credentials_path, 'w') do |file|
      YAML.dump(credentials, file)
    end
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end


  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { signed_in: true, username: "admin" } }
  end

  def test_index

    create_document "about.md"
    create_document "changes.txt"

    get "/"

   assert_equal 200, last_response.status
   assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
   assert_includes last_response.body, "about.md"
   assert_includes last_response.body, "changes.txt"

  end

  def test_viewing_text_document
    create_document "history.txt", "Ruby 0.95 released"


    get "/history.txt", {}, admin_session
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
  end

  def test_viewing_text_document_signed_out
    create_document "history.txt", "Ruby 0.95 released"

    get "/history.txt"

    assert_equal 302, last_response.status
  end


  def test_document_not_found
    create_document "notafile.txt"

    get "/notafile.ext", {}, admin_session # Attempt to access a nonexistent file

    assert_equal 302, last_response.status # Assert that the user was redirected

    #get last_response["Location"] # Request the page that the user was redirected to

    #assert_equal 200, last_response.status
    assert_equal "notafile.ext does not exist.", session[:message]

   # get "/" # Reload the page
    #refute_includes last_response.body, "notafile.ext does not exist" # Assert that our message has been removed
  end

  # test/cms_test.rb
  def test_viewing_markdowns_document
    create_document "about.md",  "# Ruby is..."
    get "/about.md", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_document_content_updated
    create_document "changes.txt", "new content"

    post "/about.md/edit", { largeTextbox: "<h1>Ruby is...</h1>" }, admin_session
    assert_equal 302, last_response.status

    assert_equal "about.md has been updated!", session[:message]
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"

    # Additional assertions can be added here to verify that the file content has been updated
  end


  def test_view_new_document_form_signed_in
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_document_form_signed_out
    get "new"

    assert_equal 302, last_response.status
    assert_equal "You are not signed in. Sign in for full access.", session[:message]
  end

  def test_create_new_document_signed_in
    post "/create",  {filename: "test.txt"}, admin_session
    assert_equal 302, last_response.status


    assert_equal "test.txt has been created.", session[:message]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_signed_out
    post "/create"

    assert_equal 302, last_response.status
    assert_equal "You are not signed in. Sign in for full access.", session[:message]


  end

  def test_create_new_document_without_filename_signed_in
    post "/create", {filename: ""}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required."
  end

  def test_create_new_document_signed_in_with_invalid_ext_name
    post "/create", {filename: "file.txtdd"}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body,  "please create a valid file ending with .txt or .md"


  end

  def test_create_new_document_without_filename_signed_out
    post "/create"

    assert_equal 302, last_response.status
    assert_equal "You are not signed in. Sign in for full access.", session[:message]
  end

  def test_duplicate_document_signed_in
    create_document("history.txt")

    post "/history.txt/duplicate", {filename: "history_duplicate.txt"}, admin_session

    assert_equal 302, last_response.status


    assert_equal "A duplicate of history.txt has been created!", session[:message]
    assert File.exist?(File.join(data_path, "history_duplicate.txt"))

  end

  def test_duplicate_document_signed_out
    create_document("history.txt")

    post "/history.txt/duplicate"

   assert_equal 302, last_response.status
   assert_equal "You are not signed in. Sign in for full access.", session[:message]

  end



  def test_deleting_document_signed_in
    create_document("test.txt")

    post "/test.txt/delete", {},  admin_session

    assert_equal 302, last_response.status

    assert_equal "The file test.txt has been deleted.", session[:message]
    get "/"
    refute_includes last_response.body, %q(href = "test.txt")
  end

  def test_deleting_document_signed_out
    create_document("test.txt")

    post "/test.txt/delete"

    assert_equal 302, last_response.status
    assert_equal "You are not signed in. Sign in for full access.", session[:message]
  end

  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "zane", password: "alabama"
    assert_equal 302, last_response.status

    assert_equal "Welcome!", session[:message]
    assert_equal "zane", session[:username]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as zane"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    post "/users/signin", username: "tom", password: "patriots"


    assert_equal "tom", session[:username]
    post "/users/signout"
    get last_response["Location"]

    assert_includes last_response.body, "You have been signed out"
    assert_includes last_response.body, "Sign In"
  end

  def test_sign_up
    post "users/signup", username: "nami", password: "burglar"

    follow_redirect!
    assert last_response.ok?
    assert_includes last_response.body, 'You have successfully created your account nami. You can now sign in. '
    assert user_exists?('nami') # You would need to define this helper method
  end

  def test_valid_bcrypting_of_password
    post "users/signup", username: "nami", password: "burglar"

    hashed_password = hash_password("burglar")
    refute_equal 'burglar', hashed_password
    assert check_password("burglar", hashed_password) # Use BCrypt to check the password was hashed

    delete_test_yaml_account('nami')
    refute YAML.load_file(load_user_credentials_path).include?('nami')
  end




end

