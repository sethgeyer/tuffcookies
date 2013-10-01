
require 'spec_helper'

module TuffCookie
  
  describe Correct_Guess_Tally do
    describe "#Tabulation of Correct Guesses" do
      let(:tally) { TuffCookie::Correct_Guess_Tally.new }
      
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





























