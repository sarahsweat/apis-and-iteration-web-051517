def welcome
  # puts out a welcome message here!
  puts "Hello and welcome to our Star Wars api_communicator"
end

def get_character_from_user
  puts "Please enter a character"
  character = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
