

module TuffCookie
  class Game
    attr_accessor :total_cards, :array_of_players, :players, :current_card, :tally, :mark, :flipped_card, :evaluation, :current_correct_guess_tally, :current_player, :numbered_cards
    def initialize(output)
      create_deck
      @output = output
      @output.puts "Welcome to Tuff Cookies!  What's your name?"
    end
 
    def start(start_card, player_name = nil)
      @output.puts "Welcome #{player_name}! The starting playing order is: #{player_name}, Noah, George, Anne"
      create_list_of_players(player_name)
      @tally = CorrectGuessTally.new(start_card)
      @current_card = start_card
      @current_player = @players[0]
      @output.puts "#{@current_player.name.upcase}'s Turn: The Card in Play is a #{@current_card}.... Higher(h) or Lower(l)? CHEAT: next_card = #{@numbered_cards}"
    end
    
    def create_deck
      numbered_cards = []
      (1..15).each do |card| 
        numbered_cards.push(card, card, card, card) # 4 for copies of card to the deck.
        numbered_cards.push("reverse")

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
      dealer_flips_card
      @mark = Mark.new(guess, current_card, flipped_card)
      @evaluation = @mark.evaluate
      @tally.update_pot(@evaluation, @flipped_card)
      update_score(@evaluation)
      new_correct_guess_tally = @tally.add_to_tally(@evaluation, current_correct_guess_tally)
      @current_player = assign_next_turn(@evaluation)
      decide_to_flip_another_card(@evaluation)
      @current_card = @flipped_card
      @output.puts "\n#{@evaluation.capitalize}. Consecutive Correct Guesses: #{new_correct_guess_tally}  POT: #{tally.pot}" #Need Test
      @output.puts "#{@current_player.name.upcase}'s Turn: The Card in Play is a #{@current_card}.... Higher(h) or Lower(l)? CHEAT: next_card = #{@numbered_cards}"  #Need Test
      #You need to add a test for the score output below.
      @output.puts "Current_Scores:  \n#{@players[0].name} = #{@players[0].won_cards.size} #{@players[0].won_cards} \n#{@players[1].name} = #{@players[1].won_cards.size} #{@players[1].won_cards} \n#{@players[2].name} = #{@players[2].won_cards.size} #{@players[2].won_cards}  \n#{@players[3].name} = #{@players[3].won_cards.size} #{@players[3].won_cards} "
      @current_correct_guess_tally = new_correct_guess_tally 
    end   
        
    def dealer_flips_card
      @flipped_card = @numbered_cards.shift
    end

    
    def decide_to_flip_another_card(evaluation)
      if evaluation == "wrong"
        dealer_flips_card
      elsif evaluation == "reverse"
        @flipped_card = @current_card
      end  
    end

    
    def update_score(evaluation)
      if evaluation == "swept" && @current_correct_guess_tally > 2
        @current_player.won_cards += @tally.pot
        @tally.pot = [@flipped_card]
      elsif evaluation == "wrong"
        @players[previous_player].won_cards += @tally.pot
        @tally.pot = [@numbered_cards[0]]
      else
        # do nothing  
      end
    end

    def previous_player
      if @players.index(@current_player) == 0
        3
      else
        @players.index(@current_player) - 1
      end
    end
    
    def assign_next_turn(evaluation)
      if evaluation == "reverse"
        @players.reverse!
        @current_player = @players[@players.index(@current_player)]
      end
      if evaluation == "correct"
        @current_player
      else
        @players[next_turn]
      end
    end 
    
    def next_turn
      if @players.size - 1 == @players.index(@current_player)
        0
      else
        @players.index(@current_player) + 1
      end
    end   

  end
  
 
end