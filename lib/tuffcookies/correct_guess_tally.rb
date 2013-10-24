
######## Keeps Tally of the number of correct guesses.  
module TuffCookie
 class CorrectGuessTally 
     attr_accessor :pot, :new_correct_guess_tally 
     def initialize(start_card)
      @pot = [start_card]
     end   
     
     def add_to_tally(evaluation, current_correct_guess_tally)
       @new_correct_guess_tally = current_correct_guess_tally.to_i
       if evaluation == "Correct"
         @new_correct_guess_tally += 1
       elsif evaluation == "Same" || evaluation == "Reverse" || evaluation == "No Guess" || evaluation == "Give 2"
         @new_correct_guess_tally
       elsif evaluation == "Wrong"
         @new_correct_guess_tally = 0
       end       
     end
     
     def update_pot(evaluation, flipped_card)
        if evaluation == "Correct" || evaluation == "Wrong" || evaluation == "Same"  || evaluation == "Reverse" || evaluation == 'No Guess'  || evaluation == 'Give 2'
          @pot << flipped_card
        end
        
     end
     
     
     
  end 
end





























