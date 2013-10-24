
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
        answer = "Swept"
      elsif @guess == "No Guess"
        answer = "No Guess"
      else
        if @flipped_card == "Reverse" 
          answer = "Reverse"
        elsif @flipped_card == "Give 2"
          answer = "Give 2"
        elsif @flipped_card == "Give Me 2"
          answer = "Give Me 2"
        elsif @flipped_card == "Suck It Nerds"
          answer = "Suck It Nerds"
        
        
        
        elsif @flipped_card != "Reverse"
          @difference = flipped_card - current_card
          if @difference > 0 # flipped card is greater than current card
            answer = if @guess == 'h'
              "Correct"  
            else
              "Wrong"
            end   
          elsif @difference < 0 #flipped card is less than the current card
            answer = if @guess == 'h'
              "Wrong"
            else
              "Correct"
            end 
          elsif @difference == 0 # flipped card is the same as current card
            answer = "Same"
          end
        end
      end
    end
      
      
      
      
      
      
      
  end
end