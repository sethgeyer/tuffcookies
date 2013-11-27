

module TuffCookie
  class Game
    attr_accessor :total_cards, :array_of_players, :players, :current_card, :tally, :mark, :flipped_card, :evaluation, :current_correct_guess_tally, :current_player, :numbered_cards, :receiver
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
      @output.puts "#{@current_player.name.upcase}'s Turn: The Card in Play is a #{@current_card}"
      
      #@output.puts "NEXT CARDS ARE: #{@numbered_cards[0..10]}"
      @output.puts "Higher(h) or Lower(l)?"
    end
    
    def create_deck
      numbered_cards = []
      (1..13).each do |card| 
        numbered_cards.push(card, card, card, card) # 4 for copies of card to the deck.
      end
      action_cards = ["Reverse", "Give 2", "Give Me 2", "Suck It Nerds", "Roshambo", "Stack Swap", "War", "Skip"]
      action_cards.each do |card|
        for i in (1..2)
          numbered_cards.push(card)
        end
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
    
    def player_choices
      if @tally.new_correct_guess_tally < 3
        "Higher(h) or Lower(l)?"
      else 
        "Higher(h) or Lower(l) or Sweep(s)?"
      end
    end
    
    def dealer_flips_card
      @flipped_card = @numbered_cards.shift
    end
    
    
    def guess(guess, current_correct_guess_tally = nil)
      @mark = Mark.new(guess, current_card, @flipped_card)
      @evaluation = @mark.evaluate
      @tally.update_pot(@evaluation, @flipped_card)
      update_score(@evaluation)
      @tally.add_to_tally(@evaluation, current_correct_guess_tally)
      @current_player = assign_next_turn(@evaluation)
      decide_to_flip_another_card(@evaluation)
      @current_card = @flipped_card
     
      @output.puts "\n#{@evaluation}. Consecutive Correct Guesses: #{@tally.new_correct_guess_tally}  POT: #{tally.pot}\n\n" #Need Test
      @output.puts "#{@current_player.name.upcase}'S TURN..........The Card in Play is a #{@current_card}"
      #@output.puts "Next Cards Are: #{@numbered_cards[0..10]}"
      #You need to add a test for the score output below.
      @output.puts "Current_Scores:  \n#{@players[0].name} = #{@players[0].won_cards.size} #{@players[0].won_cards} \n#{@players[1].name} = #{@players[1].won_cards.size} #{@players[1].won_cards} \n#{@players[2].name} = #{@players[2].won_cards.size} #{@players[2].won_cards}  \n#{@players[3].name} = #{@players[3].won_cards.size} #{@players[3].won_cards} "
      #choices = player_choices
      @output.puts player_choices  #Need Test

      @current_correct_guess_tally = @tally.new_correct_guess_tally 
    end   
        
  

    
    def decide_to_flip_another_card(evaluation)
      if evaluation == "Wrong"
        dealer_flips_card
      elsif evaluation == "No Guess" || evaluation == "Swept" || evaluation == "Correct" #Do Nothing
      elsif evaluation == "Reverse" || evaluation == "Give 2" || evaluation == "Give Me 2" || evaluation == "Suck It Nerds" || evaluation == "Roshambo" || evaluation == "Stack Swap" || evaluation == "War" || evaluation == "Skip"
          @flipped_card = @current_card
      else
        @flipped_card = "666- EVIL ERROR"
      end  
    end

    
    def update_score(evaluation)
      if evaluation == "Swept" && @current_correct_guess_tally > 2
        @current_player.won_cards += @tally.pot
        @tally.pot = [@flipped_card]
      elsif evaluation == "Wrong"
        @players[previous_player].won_cards += @tally.pot
        @tally.pot = [@numbered_cards[0]]
      elsif evaluation == "Give 2"  
        receiver = receiver_of_cards
        receiver.won_cards << @current_player.won_cards.delete_at(rand(0..@current_player.won_cards.size-1))
        receiver.won_cards << @current_player.won_cards.delete_at(rand(0..@current_player.won_cards.size-1))
      else
        # do nothing  
      end
    end
    
    def receiver_of_cards
      @recipients  = @players - [@current_player] 
      if @recipients[0].won_cards.size == @recipients[1].won_cards.size || @recipients[0].won_cards.size == @recipients[2].won_cards.size || @recipients[1].won_cards.size == @recipients[2].won_cards.size
        @recipients[rand(0..2)]
      elsif @recipients[0].won_cards.size < @recipients[1].won_cards.size
        if @recipients[0].won_cards.size < @recipients[2].won_cards.size
          @recipients[0]
        else
          @recipients[2]
        end
      else
        @recipients[1]
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
      if evaluation == "No Guess" 
          if @current_card == "Reverse"
            @players.reverse!
            @current_player = @players[next_turn]
          elsif @current_card == "Give 2"
            @current_player
          elsif @current_card == "Give Me 2"
            @current_player
          elsif @current_card == "Suck It Nerds"
            @current_player
          elsif @current_card == "Roshambo"
            @current_player
          elsif @current_card == "Stack Swap"
            @current_player
          elsif @current_card == "War"
            @current_player
          elsif @current_card == "Skip"
            @current_player = @players[next_turn]
          else
            "666- EVIL ERROR"
          end
          
      elsif evaluation == "Reverse"
        @players.reverse!
        @current_player = @players[next_turn] #@players[@players.index(@current_player)]
        
      elsif evaluation == "Correct"  || evaluation == "Give 2" || evaluation == "Give Me 2" || evaluation == "Suck It Nerds" || evaluation == "Roshambo" || evaluation == "Stack Swap" || evaluation == "War"
        @current_player
      elsif evaluation == "Skip" || evaluation == "Wrong" || evaluation == "Same" || evaluation == "Swept"
        @players[next_turn]
      else
       "666- EVIL ERROR"
        
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