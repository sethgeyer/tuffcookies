module TuffCookie
  class Game
    attr_accessor :total_cards, :next_card_in_deck, :current_card, :current_correct_guess_tally, :active_player, :evaluation, :players_turn, :players
    def initialize(output) 
      @outputz = output
      @outputz.puts "Welcome to Tuff Cookies!  What's your name?"
      @players = []
      @players << Player.new("George").name << Player.new("Anne").name << Player.new("Noah").name
    end
 
# STARTS the game by welcoming the player, identifying the first card, and calling the "create deck" function.    
    def start(start_card, player_name = nil) 
      list_of_players = @players.unshift(Player.new(player_name).name)
      create_deck
      @tally = Correct_Guess_Tally.new
      @active_player = CurrentPlayer.new(player_name, list_of_players)
      @current_card = start_card.to_i
      messages = ["What's up? The players are: #{list_of_players.join(", ")}", "Current Score is: #{@active_player.current_score}", "The Card in Play is a #{@current_card}.", "Higher (h) or Lower (l)?"]
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
    def guess(guess, current_correct_guess_tally = nil)
      mark = Mark.new(guess, @current_card, @flipped_card)
      evaluation = mark.evaluate
     # @evaluation = evaluation
      updated_score = @active_player.update_score(evaluation, current_correct_guess_tally)
      @players_turn = @active_player.assign_turn(evaluation)
      new_correct_guess_tally = @tally.add_to_tally(evaluation, current_correct_guess_tally)
      @outputz.puts evaluation
      @outputz.puts "The flipped card is a #{@flipped_card}"
      @current_card = @flipped_card
      @outputz.puts "The current card is now #{@current_card}... Higher(h) or Lower(l)?"
      @outputz.puts "Consecutive correct guesses: #{new_correct_guess_tally}"
      @outputz.puts "Current Score: #{updated_score}"
      dealer_flips_card(next_card_in_deck)
      @current_correct_guess_tally = new_correct_guess_tally
      @outputz.puts "#{@players_turn}'s Turn"
    end  
  end



end































