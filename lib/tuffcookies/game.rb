module TuffCookie
  class Game
    attr_accessor :total_cards, :next_card_in_deck, :current_card, :tally
    def initialize(output) 
      @outputz = output
      @outputz.puts "Welcome to Tuff Cookies!  What's your name?"
      @players = []
      @players << Player.new("George")
      @players << Player.new("Anne")
      @players << Player.new("Noah")
    end
 
# STARTS the game by welcoming the player, identifying the first card, and calling the "create deck" function.    
    def start(start_card, player_name = nil) 
      player = Player.new(player_name)
      create_deck
      #@tally = Tally.new
      @current_card = start_card.to_i
      messages = ["What's up #{player_name}? You are playing against:", "The Card in Play is a #{@current_card}.", "Higher (h) or Lower (l)?"]
      messages.each do |message|
        @outputz.puts message
      end
    end
  
# CREATES THE DECK for the Game
    def create_deck
      numbered_cards = []
      (1..15).each do |card| 
        numbered_cards.push(card, card, card, card) # 4 for copies of card to the deck.
      end
      @total_cards = numbered_cards.length
      @numbered_cards = numbered_cards
    end

  
# DEALER FLIPS the next card.... calls the "next_card_in_deck" function  
    def dealer_flips_card(next_card_in_deck)
      @flipped_card = next_card_in_deck.to_i
    end

# NEXT CARD IN DECK is randomly pulled from the deck of cards and fed to the dealer.    
    def next_card_in_deck
      @numbered_cards.delete_at(rand(@numbered_cards.length))
    end

# CURRENT PLAYER GUESSES the next card and relevant scoring data is fed to the MARK Class.  Feedback is sent back to the player.
    def guess(guess)
      mark = Mark.new(guess, @current_card, @flipped_card)
      evaluation = mark.evaluate
      
      #@tally.add_to_tally(evaluation)
      @outputz.puts evaluation
      @outputz.puts "The flipped card is a #{@flipped_card}!"
      @current_card = @flipped_card
      @outputz.puts "The current card is now #{@current_card}... Higher(h) or Lower(l)?"
      @outputz.puts "Consecutive correct guesses: #{tally.count}"
      dealer_flips_card(next_card_in_deck)
    end
  
     
  end


 #  class Tally    
#     attr_accessor :count
#     def add_to_tally(evaluation)
#       @count ||= 0
#       if evaluation == "correct"
#         @count = @count + 1
#       else
#         @count = 0
#       end       
#     end  
#   end







  
  class Player
    def initialize(name)
      @score = 0
    end
  end
end































