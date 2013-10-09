
######## Keeps Tally of the number of correct guesses.  
module TuffCookie
 class CorrectGuessTally 
     attr_accessor :new_correct_guess_tally   
     def add_to_tally(evaluation, current_correct_guess_tally)
       @new_correct_guess_tally = current_correct_guess_tally.to_i
       if evaluation == "correct"
         @new_correct_guess_tally += 1
       elsif evaluation == "same"
         @new_correct_guess_tally
       else
         @new_correct_guess_tally = 0
       end       
     end
  end 
end





























