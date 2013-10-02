
module TuffCookie
# PLAYER CLASS - Establishes the player's name and sets their initial score to 0
  class Player
    attr_accessor :current_score, :name
    def initialize(name)
      @name = name
      @current_score = 0
    end
  end




# CURRENT PLAYER is a subclass of Player and keeps tab of the individual's score as they play the game.
  class CurrentPlayer < Player
                      # attr_accessor :current_player , :current_score
    def initialize(current_player)
      super(current_score)      
                      # @current_player = current_player
                      # @current_score = current_score
    end
    def update_score(evaluation, current_correct_guess_tally)
      if evaluation == "swept" && current_correct_guess_tally.to_i >= 3
        @current_score += current_correct_guess_tally.to_i
      else
        @current_score
      end
    end
    
#     def assign_turn(evaluation)
#       if evaluation == "swept"
#         "Bill"
#       elsif evaluation == "correct"
#         "Seth"
#       end
#     end
    
  end

end





























