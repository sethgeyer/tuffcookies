
require 'spec_helper'

module TuffCookie
  
  describe CorrectGuessTally do
    let(:output)  {double("output").as_null_object }
    let(:game) {Game.new(output) }
    let(:tally) {CorrectGuessTally.new(7) }

    describe "#INITIALIZE" do
      it "Creates a 'pot' for the current 'cards-in-play'" do
        tally.pot.should == [7]
      end
    end
    describe "#UPDATE POT SIZE" do
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'CORRECT'" do
        it "Adds the 'current card' to the pot" do
          tally.update_pot("correct", 9)
          tally.pot.should include(9)
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'WRONG'" do
        it "Adds the 'current card' to the pot" do
          tally.update_pot("wrong", 9)
          tally.pot.should include(9)
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SAME'" do
        it "Adds the 'current card' to the pot" do
          tally.update_pot("same", 9)
          tally.pot.should include(9)
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SWEPT'" do
        it "Does NOT add the 'current card' to the pot" do
          tally.update_pot("swept", 9)
          tally.pot.should_not include(9)
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'REVERSE'" do
        it "Adds the current card to the pot" do
          tally.update_pot("reverse", "reverse")
          tally.pot.should include("reverse")
        end
      end

      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'NO_GUESS'" do
        it "Does NOT add the current card to the pot" do
          tally.update_pot("no_guess", 8)
          tally.pot.should include(8)
        end
      end




    end
    
    describe "#COUNT CORRECT GUESSES" do  
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'CORRECT'" do
         context "The current_correct_guess_tally is equal to 0" do
           it "Sets the new_correct_guess_tally equal to 1" do             
             expect {tally.add_to_tally("correct", 0)}.to change{tally.new_correct_guess_tally}.to(1)        
           end
         end
         context "The current_correct_guess_tally is equal to 2" do
           it "Sets the new_correct_guess_tally equal to 3" do
             expect {tally.add_to_tally("correct", 2)}.to change{tally.new_correct_guess_tally}.to(3)        
           end
         end
      end
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'NO_GUESS'" do
         context "The current_correct_guess_tally is equal to 0" do
           it "Sets the new_correct_guess_tally equal to 0" do             
             expect {tally.add_to_tally("no_guess", 0)}.to change{tally.new_correct_guess_tally}.to(0)        
           end
         end
         context "The current_correct_guess_tally is equal to 2" do
           it "Sets the new_correct_guess_tally equal to 2" do
             expect {tally.add_to_tally("no_guess", 2)}.to change{tally.new_correct_guess_tally}.to(2)        
           end
         end
      end
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'WRONG'" do
        context "The current_correct_guess_tally is equal to 0" do
          it "Sets the new_correct_guess_tally equal to 0" do
            expect {tally.add_to_tally("wrong", 0)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
        context "The current_correct_guess_tally is equal to 2" do
          it "Sets the new_correct_guess_tally equal to 0" do
            expect {tally.add_to_tally("wrong", 2)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SAME'" do
        context "The current_correct_guess_tally is equal to 0" do
          it "Sets the new_correct_guess_tally equal to 0" do
            expect {tally.add_to_tally("same", 0)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
        context "The current_correct_guess_tally is equal to 2" do
          it "Sets the new_correct_guess_tally equal to 2" do
            expect {tally.add_to_tally("same", 2)}.to change{tally.new_correct_guess_tally}.to(2)        
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'REVERSE'" do
        context "The current_correct_guess_tally is equal to 0" do
          it "Sets the new_correct_guess_tally equal to 0" do
            expect {tally.add_to_tally("reverse", 0)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
        context "The current_correct_guess_tally is equal to 2" do
          it "Sets the new_correct_guess_tally equal to 2" do
            expect {tally.add_to_tally("reverse", 2)}.to change{tally.new_correct_guess_tally}.to(2)        
          end
        end
      end
    end

  end
end





























