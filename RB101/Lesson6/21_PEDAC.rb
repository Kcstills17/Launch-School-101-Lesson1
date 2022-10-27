# game of 21

# General Pedac

=begin
P. Understand the Problem
  Explicit Requirements:
  - game must have a user and a dealer.
  - both the user and the dealer choose cards
  - Initially both the player and dealer are randomly dealt 2 cards
  - the player and dealer select cards(hit) until either one of them reaches 21
    or busts(card value becomes greater than 21)
  - there are 4 sets of cards Diamonds, Aces, Spades, and Hearts
    each consist of 13 values 2-10 and King, Jack, Queem and Ace
  - Ace can represent either 1 or 11 depending if 11 would cause
    the current user to bust or not
  -  the dealer must hit until the value is 17 or greater then
    the dealer should stay (Not draw a card that turn)
  - if the player or dealer has drawn more than one ace and the value
    would be greater than 21 if all are 11 than some of the ace's must
    one to fit the requirements
  - When the player stays it is the dealer's turn. And vice versa. Continue play
    until one has either reached 21 or busted.
  - if both users stay than both scores should be compared to see who has
    the higher total
    end


  Implicit Requirements:
  -

  Clarifications/ Questions:
  -

E: Examples/ Edge Cases
 -

D: Data Structures
  - possible: Hash for the different sets of cards


A: Algorithm
  High Level general Algorithm for game
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

C: Code with intent
