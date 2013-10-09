

module TuffCookie
  class Game
    attr_accessor :total_cards, :array_of_players, :player0, :player1, :player2, :player3, :current_player, :current_card, :mark, :numbered_cards, :flipped_card, :evaluation
    def initialize(output)
      @output = output
      @output.puts "Welcome to Tuff Cookies!  What's your name?"
    end
 
    def start(start_card, player_name = nil)
    @output.puts "Welcome #{player_name}! The starting playing order is: #{player_name}, Noah, George, Anne"
    create_deck
    create_list_of_players(player_name)
    @current_card = start_card
    @current_player = @player0
    @output.puts "#{@current_player.name.upcase}'s Turn: The Card in Play is a 7.... Higher(h) or Lower(l)?"
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
            @array_of_players.each do |player| 
              instance_variable_set("@player#{@array_of_players.index(player)}", Player.new(player))
            end
          end
    
    def guess(guess)
      guess = guess
      @flipped_card = dealer_flips_card
      @mark = Mark.new(guess, current_card, flipped_card)
      @evaluation = @mark.evaluate
      @output.puts @evaluation
      @current_card = @flipped_card
    end   
        
          def dealer_flips_card
            numbered_cards.shift
          end    

  end
  
  class Player
    attr_accessor :name, :score
    def initialize(name)
      @name = name
      @score = 0
    end
  end
  
 
  
  
  
end