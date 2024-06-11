USERNAME = "Master_Programmer"
PASSWORD = "123"




loop do
  puts ">> please enter your username:"
  username = gets.chomp
  puts ">> Please enter your Password"
  password = gets.chomp
  if username == "Master_Programmer" && password == "123"
      puts "Welcome back #{USERNAME}"
      break
  else
    puts "Either the password or Username are not valid. Please try again."
  end
end



