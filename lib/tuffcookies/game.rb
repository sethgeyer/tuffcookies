

module TuffCookie
  class Game
    attr_accessor :total_cards, :array_of_players, :players, :current_card, :tally, :mark, :flipped_card, :evaluation, :current_correct_guess_tally, :current_player, :numbered_cards
    def initialize(output)
      @output = output
      @output.puts "Welcome to Tuff Cookies!  What's your name?"
    end
 
    def start(start_card, player_name = nil)
      @output.puts "Welcome #{player_name}! The starting playing order is: #{player_name}, Noah, George, Anne"
      create_deck
      create_list_of_players(player_name)
      @tally = CorrectGuessTally.new
      @current_card = start_card
      @current_player = player_name
      @output.puts "#{@current_player.upcase}'s Turn: The Card in Play is a #{@current_card}.... Higher(h) or Lower(l)?"
    end
    
    def create_deck
      numbered_cards = []
      (1..15).each do |card| 
        numbered_cards.push(card, card, card, card) # 4 for copies of card to the deck.
      end
      @total_cards = numbered_cards.length
      @numbered_cards = numbered_cards.shuffle
    end
    
    def create_list_of_players(starting_players_name)
      @array_of_players = ["#{starting_players_name}", "Noah", "George", "Anne"]
      @players = []
      @array_of_players.each do |player| 
        @players << Player.new(player)
      end
    end
    
    def guess(guess, current_correct_guess_tally = nil)
      @flipped_card = dealer_flips_card
      @mark = Mark.new(guess, current_card, flipped_card)
      @evaluation = @mark.evaluate
      new_correct_guess_tally = @tally.add_to_tally(@evaluation, current_correct_guess_tally)
      @current_card = @flipped_card
      @output.puts "#{@evaluation.capitalize}. Consecutive Correct Guesses: #{new_correct_guess_tally}" #Need Test
      @output.puts "#{@current_player.upcase}'s Turn: The Card in Play is a #{@current_card}.... Higher(h) or Lower(l)?"  #Need Test
      @current_correct_guess_tally = new_correct_guess_tally 
    end   
        
          def dealer_flips_card
            @numbered_cards.shift
          end    

  end
  
 
end