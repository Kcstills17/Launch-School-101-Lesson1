require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

before do
  @contents = File.readlines('data/toc.txt') #since this data is always needed. It is great to use in a before filter that will always load this data.
  #@chapter = File.read ("data/chp#{number}.txt")
  @chapters_content = (1..@contents.size).map do |number|
    File.read("data/chp#{number}.txt")
  end

end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
number = params[:number].to_i
chapter_name = @contents[number - 1]
redirect "/" unless (1..@contents.size).to_a.include?(number)

@chapter = File.read ("data/chp#{number}.txt")

@title = "Chapter #{number}: #{chapter_name}"

erb :chapter
end

# View helpers.  These are methods that are made available in templates by Sinatra for the purpose of filtering data, processing data,
# or performing some other functionality. These helpers are available in all templates that you have embedded
helpers do
  def split_into_paragraphs(text)
    text.split("\n\n")
  end


  def render_paragraphs(text)
    split_into_paragraphs(text).map { |para| "<p>#{para}</p>" }.join
  end
# We have listed each chapter that the search item matches. Now we want to also output the paragraph that  the search was found on.

  def search_value_hash(title, ch_contents, search_item)
    search_hash = Hash.new { |hash, key| hash[key] = [] }  # Initialize the hash with default empty arrays

    title.each_with_index do |chapter_title, index|
      # Splitting the content into paragraphs

      paragraphs = split_into_paragraphs(ch_contents[index])

      # For each paragraph, if it matches the search_item, append it to the corresponding array in the hash

      paragraphs.each do |paragraph|

        if match_str(paragraph, search_item)
          search_hash[chapter_title] << paragraph
        end
      end
    end

    search_hash
  end


def match_str(content, search_item)
  content.match?(/#{Regexp.escape(search_item)}/i)
end



def no_matches?(ch_contents, search_item)
  !match_str(ch_contents, search_item)
end
def bold_search_result(str, search)
  str.gsub(/#{Regexp.escape(search)}/i, "<strong>\\0</strong>")
end

  # need to generate search. search accounts for each individual char and each  upto full substring of a word. So must have helper method to generate substr
end



# not found routes provide functionality to when a route of unknown origin is requested

not_found do
  redirect "/"
end

get "/search" do
  @query = params[:query] || ""
  @chapters_content
  erb :search
end



#  title (each chapter name ) (have to get an array of all chapter titles ase each index value )
# chapter_contents(take the index of the value from the array that has all chapters and increment by 1 to use to read contents using File class)

=begin
how to get specific paragraphs of matching chapter under matching chapter
- change match_str (rn it returns a boolean but we need a structure to capture more value for this)
- perhaps a hash which the chapter title can be the key and the value is an array
=end
