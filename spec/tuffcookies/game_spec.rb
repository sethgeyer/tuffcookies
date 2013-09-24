

require 'spec_helper'

module TuffCookie
  describe Game do
    let(:test_double_output)  {double("testdouble").as_null_object }
    let(:game) {Game.new(test_double_output) }

############ DESCRIBE START OF GAME
    describe "#Start" do     
      it "send the start messages" do
        test_double_output.should_receive(:puts).with("Welcome to Tuff Cookies!")
        game.start('7')
      end
      it "sends a second welcome message" do
        test_double_output.should_receive(:puts).with("err... I mean NGDubs!")
        game.start('7')
      end
      it "identifies the first card" do
        test_double_output.should_receive(:puts).with("In any case, the Card in Play is a 7.")
        game.start('7')
      end
      it "sends requests a guess" do
        test_double_output.should_receive(:puts).with("Higher (h) or Lower (l)?")
        game.start('7')
      end
    end

########### DESCRIBE EVALUATION OF CARD 
    describe "#Evaluate" do
      context "when current_card is 7 and the next_card is 9" do
        context "and the guess was higher" do      
          it "should be 'correct'" do
            test_double_output.should_receive(:puts).with("correct")
            game.start('7')
            game.flipped_card('9')
            game.guess('h')
          end
        end
        context "and the guess was lower" do      
          it "should be 'wrong'" do
            test_double_output.should_receive(:puts).with("wrong")
            game.start('7')
            game.flipped_card('9')
            game.guess('l')
          end
        end
      end

      context "when current_card is 7, the next_card is 6" do
        context "and the guess was higher" do      
          it "should be 'wrong'" do
            test_double_output.should_receive(:puts).with("wrong")
            game.start('7')
            game.flipped_card('6')
            game.guess('h')
          end
        end
        context "and the guess was lower" do      
          it "should be 'correct'" do
            test_double_output.should_receive(:puts).with("correct")
            game.start('7')
            game.flipped_card('6')
            game.guess('l')
          end
        end
      end
      
      context "when current_card is 7 and the next_card is 7" do
        context "and the guess is higher" do      
          it "should be 'same'" do
            test_double_output.should_receive(:puts).with("same")
            game.start('7')
            game.flipped_card('7')
            game.guess('h')
          end
        end
        context "and the guess was lower" do      
          it "should be 'same'" do
            test_double_output.should_receive(:puts).with("same")
            game.start('7')
            game.flipped_card('7')
            game.guess('l')
          end
        end
      end
    end
    
    describe "#Tally" do
      it "should be the number of correct answers"
    end
  
  
  
  
  
  end
end






































