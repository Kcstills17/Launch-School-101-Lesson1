# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge(character_classes[input])
p character_classes[input]
puts 'Your character stats:'
player = player.merge(character_classes[input])  # this is one solution to our newly created symbol to be added to our original hash
puts player                                      # assign the original variable to the newly merged hashes.
                                                 # if you want to mutate the original hash just use merge! as opposed to merge
