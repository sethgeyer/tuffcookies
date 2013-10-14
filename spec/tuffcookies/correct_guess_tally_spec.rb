
require 'spec_helper'

module TuffCookie
  
  describe CorrectGuessTally do
    let(:tally) {CorrectGuessTally.new(7) }
    let(:output)  {double("output").as_null_object }
    let(:game) {Game.new(output) }
    describe "INITIALIZE" do
      it "CREATES a 'pot' for the cards in play" do
        tally.pot.should == [7]
      end
    end
    
    
    describe "#UPDATE POT SIZE" do
      context "The mark evaluation is correct" do
        it "adds the current card to the pot" do
          tally.update_pot("correct", 9)
          tally.pot.should include(9)
        end
      end
      context "The mark evaluation is wrong" do
        it "adds the current card to the pot" do
          tally.update_pot("wrong", 9)
          tally.pot.should include(9)
        end
      end
      context "The mark evaluation is same" do
        it "adds the current card to the pot" do
          tally.update_pot("same", 9)
          tally.pot.should include(9)
        end
      end
      context "The mark evaluation is swept" do
        it "does not add the current card to the pot" do
          tally.update_pot("swept", 9)
          tally.pot.should_not include(9)
        end
      end
      
      
      
    end
    
    
    
    describe "#COUNT Correct Guesses" do
     
      
      context "when the guess is 'correct'" do
         context "and the current_correct_guess_tally is '0'" do
           it "the new_correct_guess_tally should be 1" do             
             expect {tally.add_to_tally("correct", 0)}.to change{tally.new_correct_guess_tally}.to(1)        
           end
         end
         context "and the current_correct_guess_tally is '2'" do
           it "the new_correct_guess_tally should be 3" do
             expect {tally.add_to_tally("correct", 2)}.to change{tally.new_correct_guess_tally}.to(3)        
           end
         end
      end
      context "when the guess is 'wrong'" do
        context "and the current_correct_guess_tally is '0'" do
          it "the new_correct_guess_tally should be 0" do
            expect {tally.add_to_tally("wrong", 0)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
        context "and the current_correct_guess_tally is '2'" do
          it "the new_correct_guess_tally should be 0" do
            expect {tally.add_to_tally("wrong", 2)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
      end

      context "when the guess is 'same'" do
        context "and the current_correct_guess_tally is '0'" do
          it "the new_correct_guess_tally should be 0" do
            expect {tally.add_to_tally("same", 0)}.to change{tally.new_correct_guess_tally}.to(0)        
          end
        end
        context "and the current_correct_guess_tally is '2'" do
          it "the new_correct_guess_tally should be 2" do
            expect {tally.add_to_tally("same", 2)}.to change{tally.new_correct_guess_tally}.to(2)        
          end
        end
      end
    end
  end


end





























