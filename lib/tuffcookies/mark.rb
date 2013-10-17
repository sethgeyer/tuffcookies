
module TuffCookie 
  
  class Mark
    attr_accessor :guess, :current_card, :flipped_card, :difference
    def initialize(guess, current_card, flipped_card)
      @guess = guess
      @current_card = current_card
      @flipped_card = flipped_card
    end
  
    def evaluate  
      if @guess == "s"
        answer = "swept"
      elsif @guess == "no_guess"
        answer = "no_guess"
      else
        if @flipped_card == "reverse" 
          answer = "reverse"
        elsif @flipped_card != "reverse"
          @difference = flipped_card - current_card
          if @difference > 0 # flipped card is greater than current card
            answer = if @guess == 'h'
              "correct"  
            else
              "wrong"
            end   
          elsif @difference < 0 #flipped card is less than the current card
            answer = if @guess == 'h'
              "wrong"
            else
              "correct"
            end 
          elsif @difference == 0 # flipped card is the same as current card
            answer = "same"
          end
        end
      end
    end
      
      
      
      
      
      
      
  end
end