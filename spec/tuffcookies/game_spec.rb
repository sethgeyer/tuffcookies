
require 'spec_helper'

module TuffCookie
  describe Game do
    let(:test_double)  {double("testdouble").as_null_object }
    let(:game) {Game.new(test_double) }

############ START OF GAME
    describe "#Start" do
      it "asks a user for his/her name" do
        test_double.should_receive(:puts).with("Welcome to Tuff Cookies!  What's your name?")
        game.start(7)
      end
      it "welcomes the person" do
        test_double.should_receive(:puts).with("What's up Seth? You are playing against:")
        game.start(7, "Seth")
      end      
      it "identifies the first card" do
         test_double.should_receive(:puts).with("The Card in Play is a 7.")
        game.start(7)
      end
      it "asks user to guess" do
        test_double.should_receive(:puts).with("Higher (h) or Lower (l)?")
        game.start(7)
      end
    end
  
########### CREATION OF DECK
    describe "#New Deck" do   
      it "has 60 new numbered cards" do
        game.start(7)
        game.total_cards.should == 60
      end 
    end

########### EVALUATION OF CARD 
    describe "#Evaluate Players Guess" do
      context "when current_card is 7 and the next_card is 8" do
        before(:each) do 
          game.start(7) 
          game.dealer_flips_card(8) 
        end 
        context "and the guess was higher" do      
          it "should be 'correct'" do
            test_double.should_receive(:puts).with("correct")
            game.guess('h')
          end
        end
        context "and the guess was lower" do      
          it "should be 'wrong'" do
            test_double.should_receive(:puts).with("wrong")
            game.guess('l')
          end
        end
      end

      context "when current_card is 7, the next_card is 6" do
        before(:each) do
            game.start(7)
            game.dealer_flips_card(6)
        end
        context "and the guess was higher" do      
          it "should be 'wrong'" do
            test_double.should_receive(:puts).with("wrong")
            game.guess('h')
          end
        end
        context "and the guess was lower" do      
          it "should be 'correct'" do
            test_double.should_receive(:puts).with("correct")
            game.guess('l')
          end
        end
      end
      
      context "when current_card is 7 and the next_card is 7" do
        before(:each) do
            game.start(7)
            game.dealer_flips_card(7)
        end
        context "and the guess is higher" do      
          it "should be 'same'" do
            test_double.should_receive(:puts).with("same")
            game.guess('h')
          end
        end
        context "and the guess was lower" do      
          it "should be 'same'" do
            test_double.should_receive(:puts).with("same")
            game.guess('l')
          end
        end
      end
    end
  
 
  
  end



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





























