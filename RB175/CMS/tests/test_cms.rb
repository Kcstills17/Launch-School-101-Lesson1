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


  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
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


    get "/history.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
  end


  def test_document_not_found
    create_document "notafile.txt"

    get "/notafile.ext" # Attempt to access a nonexistent file

    assert_equal 302, last_response.status # Assert that the user was redirected

    get last_response["Location"] # Request the page that the user was redirected to

    assert_equal 200, last_response.status
    assert_includes last_response.body, "notafile.ext does not exist"

    get "/" # Reload the page
    refute_includes last_response.body, "notafile.ext does not exist" # Assert that our message has been removed
  end

  # test/cms_test.rb
  def test_viewing_markdowns_document
    create_document "about.md",  "# Ruby is..."
    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_document_content_updated
    create_document "changes.txt", "new content"

    post "/about.md/edit", { largeTextbox: "<h1>Ruby is...</h1>" }
    assert_equal 302, last_response.status

    get last_response["Location"]

    assert_includes last_response.body, "about.md has been updated!"

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"

    # Additional assertions can be added here to verify that the file content has been updated
  end


  def test_view_new_document_form
    get "/new"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_document
    post "/create",  filename: "test.txt"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "test.txt has been created"

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_without_filename
    post "/create", filename: ""
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required."
  end

  def test_deleting_document
    create_document("test.txt")

    post "/test.txt/delete"

    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "test.txt has been deleted"

    get "/"
    refute_includes last_response.body, "test.txt"
  end

  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "Welcome"
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    post "/users/signin", username: "admin", password: "secret"
    get last_response["Location"]
    assert_includes last_response.body, "Welcome"

    post "/users/signout"
    get last_response["Location"]

    assert_includes last_response.body, "You have been signed out"
    assert_includes last_response.body, "Sign In"
  end

end

