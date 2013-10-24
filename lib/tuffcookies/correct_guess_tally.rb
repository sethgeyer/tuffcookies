
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
       elsif evaluation == "Same" || evaluation == "Reverse" || evaluation == "No Guess" || evaluation == "Give 2" || evaluation == "Give Me 2" || evaluation == "Suck It Nerds" || evaluation == "Roshambo" || evaluation == "Stack Swap" || evaluation == "War" || evaluation == "Skip"
         @new_correct_guess_tally
       elsif evaluation == "Wrong" || evaluation == "Swept"
         @new_correct_guess_tally = 0
       else 
        @new_correct_guess_tally = "666- EVIL ERROR"
       end       
     end
     
     def update_pot(evaluation, flipped_card)
        if evaluation == "Correct" || evaluation == "Wrong" || evaluation == "Same"  || evaluation == "Reverse" || evaluation == 'No Guess'  || evaluation == 'Give 2'  || evaluation == 'Give Me 2' || evaluation == "Suck It Nerds" || evaluation == "Roshambo" || evaluation == "Stack Swap" || evaluation == "War" || evaluation == "Skip"
          @pot << flipped_card
        end
        
     end
     
     
     
  end 
end





























