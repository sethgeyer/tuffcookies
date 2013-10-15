
######## Keeps Tally of the number of correct guesses.  
module TuffCookie
 class CorrectGuessTally 
     attr_accessor :new_correct_guess_tally, :pot
     def initialize(start_card)
      @pot = [start_card]
     end   
     
     def add_to_tally(evaluation, current_correct_guess_tally)
       @new_correct_guess_tally = current_correct_guess_tally.to_i
       if evaluation == "correct"
         @new_correct_guess_tally += 1
       elsif evaluation == "same" || evaluation == "reverse"
         @new_correct_guess_tally
       else
         @new_correct_guess_tally = 0
       end       
     end
     
     def update_pot(evaluation, flipped_card)
        if evaluation == "correct" || evaluation == "wrong" || evaluation == "same"  || evaluation == "reverse"
          @pot << flipped_card
        end
        
     end
     
     
     
  end 
end





























