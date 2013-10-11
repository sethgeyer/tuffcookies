require 'spec_helper'

module TuffCookie
  describe Mark do
    describe "#New Mark" do
      it "initializes with 'guess' and 'current_card' and 'flipped_card'" do
        mark = Mark.new('h', 7, 8)
        mark.guess.should == 'h'
        mark.current_card.should == 7
        mark.flipped_card.should == 8
      end
    end
   
    describe "#Evaluate Players Guess" do
      context "the player chooses to take his cards" do
        context "and the guess was 's'" do      
          it "answer should be 'sweep'" do
            mark = Mark.new('s', 7, 8)
            mark.evaluate.should == "swept"
          end
        end
      end
      
      context "the player chooses to not take the cards in play" do
        context "when current_card is greater than the next card" do
          context "and the guess was higher" do      
            it "answer should be 'correct'" do
              mark = Mark.new('h', 7, 8)
              mark.evaluate.should == "correct"
            end
          end
          context "and the guess was lower" do      
            it "answer should be 'wrong'" do
              mark = Mark.new('l', 7, 8)
              mark.evaluate.should == "wrong"
            end
          end
        end
        
        context "when current_card is less than the next card" do
          context "and the guess was higher" do      
            it "answer should be 'wrong'" do
              mark = Mark.new('h', 7, 6)
              mark.evaluate.should == "wrong"
            end
          end
          context "and the guess was lower" do      
            it "answer should be 'correct'" do
              mark = Mark.new('l', 7, 6)
              mark.evaluate.should == "correct"
            end
          end
        end
        
        context "when current_card is equal to the next card" do
          context "and the guess was higher" do      
            it "answer should be 'same'" do
              mark = Mark.new('h', 7, 7)
              mark.evaluate.should == "same"
            end
          end
          context "and the guess was lower" do      
            it "answer should be 'same'" do
              mark = Mark.new('l', 7, 7)
              mark.evaluate.should == "same"
            end
          end
        end
      
      end
      
      
    end

    
    
  end
end
