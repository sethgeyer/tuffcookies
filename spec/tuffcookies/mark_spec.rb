require 'spec_helper'

module TuffCookie
  describe Mark do
    describe "#NEW MARK" do
      it "Initializes with 'guess' and 'current_card' and 'flipped_card'" do
        mark = Mark.new('h', 7, 8)
        mark.guess.should == 'h'
        mark.current_card.should == 7
        mark.flipped_card.should == 8
      end
    end
   
    describe "#EVALUATE MARK" do
      context "The Current_Card is not 'Guessable'" do
        context "The Current Card is a 'reverse'" do
          it "Evaluates the Mark as 'SWEPT'" do
            mark = Mark.new('no_guess', 7, 8)
            mark.evaluate.should == "no_guess"
          end
        end
      end
      
      
      
      
      
      
      
      
      
      context "Player chooses to SWEEP (s) the cards in the pot" do
        it "Evaluates the Mark as 'SWEPT'" do
          mark = Mark.new('s', 7, 8)
          mark.evaluate.should == "swept"
        end
      end
      
      context "Player chooses to NOT SWEEP the cards in the pot" do
        context "Flipped card is NOT a numbered card" do
          context "Flipped card is a 'REVERSE'" do
            it "Evaluates the Mark as 'REVERSE''" do
              mark = Mark.new('h', 7, "reverse")
              mark.evaluate.should == "reverse"
            end
          end
        end
        
        context "Flipped card IS a numbered card" do
          context "Current_card > Flipped Card" do
            context "Player's Guess was Higher" do      
              it "Evaluates the Mark as 'CORRECT'" do
                mark = Mark.new('h', 7, 8)
                mark.evaluate.should == "correct"
              end
            end
            context "Player's Guess was Lower" do      
              it "Evaluates the Mark as 'WRONG'" do
                mark = Mark.new('l', 7, 8)
                mark.evaluate.should == "wrong"
              end
            end
          end
          context "Current_card < Flipped Card" do
            context "Player's Guess was Higher" do      
              it "Evaluates the Mark as 'WRONG'" do
                mark = Mark.new('h', 7, 6)
                mark.evaluate.should == "wrong"
              end
            end
            context "Player's Guess was Lower" do      
              it "Evaluates the Mark as 'CORRECT'" do
                mark = Mark.new('l', 7, 6)
                mark.evaluate.should == "correct"
              end
            end
          end
        
          context "Current card = Flipped card" do
            context "Player's guess was higher" do      
              it "Evaluates the Mark as 'SAME'" do
                mark = Mark.new('h', 7, 7)
                mark.evaluate.should == "same"
              end
            end
            context "Player's guess was lower" do      
              it "Evaluates the Mark as 'SAME'" do
                mark = Mark.new('l', 7, 7)
                mark.evaluate.should == "same"
              end
            end
          end
        end      
      end
      
      
    end

    
    
  end
end
