
# using the =~ operator to match values in a regex.
def has_a_b(string)
  if string  =~/b/  #/b/.match() will also accomplish the same feat! e.g. if /b/.match(string)
    puts "there indeed is a b within these contents"
  else
    puts "OOF. Get your B's up man"
  end
end

puts has_a_b("basketball")
puts has_a_b("charity")
puts has_a_b("Austin Powers")
puts has_a_b("Lebron James")




def test(b)
  b.map {|letter| "I like the letter #{letter}"}
end

a = ['a','b', 'c']
puts test(a)



# program that checks whether 'lab' exist within the given string

def has_def?(string)
  begin
  if string =~ /lab/i
    puts string
  else
    puts "you need the lab"
  end
rescue => e
  puts "Somehow has_def? has failed."
  end
end

has_def?('laboratory')
has_def?('experiment')
has_def?('pans Labryinth')
has_def?('elaborate')
has_def?('polar bear')
