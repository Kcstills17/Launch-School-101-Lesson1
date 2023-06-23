=begin
Description
1. There are two participants. The Player and the dealter
2. There are 4 different types of cards. Aces, Spades, Hearts, and Diamonds. Each set containing 13 cards
leading to 52 total cards
3. both participants are initially given 2 cards from the deck randomly.
4.  the player will go first and can either hit or stay. He can hit until he busts (aka loses). If he stays it is the opponents turn
5. the dealer must hit unitl his total card value is atleast 17 (or he busts while trying)
6. After both sides have drawn. Whoever has a higher card total wins, or if somebody busts the other player wins.
7. If there is a tie neither win.

Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts



Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here, or in Deck?)
Participant
Deck
- deal (should this be here, or in Dealer?)
Card
- store cards in some collection (array or hash )
Game
- start

=end

#skeleton

=begin
class responsibilities
  Card : create cards, create suits and faces and be able to reference them, be able to check if card's face is ace, king, jack, or queen for later
  Deck: : create deck for cards to be eventually set to, shuffle the deck, score deck's totals and add/subtract based on the face values. determine if cards bust
  Participant: have access to own card deck and be able set name
  Player: show their hand and be prompted their name
  Dealer: show their hand and have their name chosen from a group of possible names
  TwentyOne: initialize instance from Deck, Player, and Dealer
  go through the steps to make sure this occurs.
    1. player and dealer are dealed a set of suit and a face 2 times
    2. display the hand of both participants.
    3.Show that it is the player turn and then begin a loop in which the player decides to hit or stay. if the player busts. show that they have lost
    4. Show that it is the Dealers turn and then begin a loop in which the dealer chooses to hit or stay based on whether his card total is >= 17
      if they bust then show that they hove lost and the player wins.
    5. give the player the option to play again.
      end
end

=end
require "pry"

module Clear
  def clear_terminal
    sleep 1.5
    system "clear"
  end
end

module Hand
  def show_hand
    puts "                        "
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def total
    total = 0

    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.face.to_i
      end
    end
    # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end


  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

module Display
  def explain_game
    display_welcome_message
    display_rules
    press_any_key_to_continue
  end

  def display_welcome_message
    puts "Hello #{player.name} and welcome to 21"
    puts "Allow me to explain the rules so there are no questions"
    puts "-------------------------------------------------------"
    puts "The goal of the game is to get as close to 21 as possible without going over."
    puts "You will be playing against the dealer."
    puts "-------------------------------------------------------"
  end

  def display_rules
    puts "Here are the rules:"
    puts "- There are four suits: Diamonds, Spades, Hearts, and Clubs."
    puts "- Each suit has a set of identical cards ranging from 1 to 9, King, Queen, Jack, and Ace."
    puts "- Each named face card (King, Queen, Jack) is worth 10 points, and Ace is worth 11 points."
    puts "- Both you and the dealer will be dealt 2 cards at the beginning."
    puts "- You can choose to 'hit' to draw another card or 'stay' to keep your current total."
    puts "- If you go over 21, you bust and lose the round. The same rules apply to the dealer."
    puts "- If you or the dealer have a higher total without busting, that player wins the round."
    puts "- Each victory counts as a round. The player with the most wins after 5 rounds wins the game."
    puts "-------------------------------------------------------"
    puts "You will be playing against #{dealer.name}."
  end

  def press_any_key_to_continue
    puts "Press any key to continue..."
    gets.chomp
  end

  def display_cards(participant)
    puts "                "
    puts "---- #{participant.name}'s Hand ----"
    player.cards.map {|card|  "=> #{card}"}
  end

  def display_total(participant)
    puts "---------------"
    puts "player total: #{participant.total}"
    puts "---------------"
  end

end

class Card
  attr_reader :cards

  CARDS = {
    'Hearts' => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'],
    'Diamonds' => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'],
    'Clubs' => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'],
    'Spades' => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  }

  def initialize( suit, face)
    @suit = suit
    @face = face

  end

  def to_s
    "#{face} of #{suit} "
  end

def suit
  case @suit
  when "Hearts"
    'Hearts'
  when 'Diamonds'
    'Diamonds'
  when 'Clubs'
    "Clubs"
  when 'Spades'
    'Spades'
  end
end


def face
  case @face
  when 'J' then 'Jack'
  when 'Q' then 'Queen'
  when 'K' then 'King'
  when 'A' then 'Ace'
  else
    @face
  end
end



def ace?
  face == 'Ace'
end

def king?
  face == 'King'
end

def queen?
  face == 'Queen'
end

def jack?
  face == 'Jack'
end

end


class Deck
  include Hand
  attr_accessor :cards, :score, :total
  def initialize
    @total = 0
    @cards = []
    Card::CARDS.keys.each do |suit|
    Card::CARDS.values.uniq.flatten.each do |face|
      @cards << Card.new(suit, face)

    end
    end
    shambles!
  end

  def shambles!
    cards.shuffle!
  end

  def deal_set
    cards.pop
  end


end



class Participant
  include Hand
  attr_reader :name
  attr_accessor :cards, :deck
  def initialize
    @cards = []
    @name = set_name
  end


  def to_s
      name
  end

end



class Player < Participant



  def set_name
    answer = nil
    puts "What is your name?"
    loop do
      answer = gets.chomp.downcase
      break unless answer.empty?
    end
    answer.capitalize
  end

end

class Dealer < Participant
def initialize
  super
end

  def set_name
    ['Goku', 'Kaiji', 'Light', 'Griffith', 'Gaara'].sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts "#{cards.first}"
    puts " ?? "
    puts ""
  end

end






class TwentyOne
  include Clear
  include Display
  attr_accessor :player, :dealer, :deck
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @introduction = explain_game
    @deck = Deck.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

    def start
      clear_terminal
      round
    end

   # private

    def deal_cards
      2.times do |_|
        player.add_card(deck.deal_set)
        dealer.add_card(deck.deal_set)
      end
    end

    def show_initial_cards
      player.show_hand
      dealer.show_flop
    end

    def show_cards
      player.show_hand
      dealer.show_hand
    end







    def player_turn
      loop do
        if hit_or_stay == 's'
          puts "#{player.name} stays!"
          break
        elsif player.busted?
         break
        else
          player.add_card(deck.deal_set)
          puts "#{player.name} hits!"
          player.show_hand
          break if player.busted?
          end
        end
      end


    def hit_or_stay
      puts "would you like to hit or stay? (h/s)"
      response = nil
      loop do
        response = gets.chomp.downcase
        break if ['h', 's'].include?(response)
        puts "please choose to hit or stay"
      end
      response
    end

    def dealer_turn
      puts "#{dealer.name}'s turn..."

      loop do
        if dealer.total >= 17 && !dealer.busted?
          puts "#{dealer.name} stays!"
          break
        elsif dealer.busted?
          break
        else
          puts "#{dealer.name} hits!"
          dealer.add_card(deck.deal_set)
        end
      end
    end



    def show_result
      if player.busted?
        puts "#{player.name} has busted! #{dealer.name} wins!"
      elsif dealer.busted?
        puts "#{dealer.name} has busted! #{player.name} wins!"
      elsif player.total > dealer.total
        puts "#{player.name} wins! "
      elsif player.total < dealer.total
        puts "#{dealer.name} wins"
      else
        puts "there is a tie."
      end
    end

    def play_again?
      answer = nil
      puts "Would you like to play again? (Y/N)"
      loop do
        answer = gets.chomp
        break if ['y','n'].include?(answer.downcase)
      end
      answer == 'y'
    end

    def round
      answer = nil
      loop do
        deal_cards
        show_initial_cards
        player_turn
        dealer_turn
        show_cards
        show_result
        reset
        clear_terminal
        break unless play_again?
      end
    end


end

game = TwentyOne.new

 game.start
