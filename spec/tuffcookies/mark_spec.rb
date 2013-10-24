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
          it "Evaluates the Mark as 'No Guess'" do
            mark = Mark.new('No Guess', 7, 8)
            mark.evaluate.should == "No Guess"
          end
        end
      end
      
      context "Player chooses to SWEEP (s) the cards in the pot" do
        it "Evaluates the Mark as 'SWEPT'" do
          mark = Mark.new('s', 7, 8)
          mark.evaluate.should == "Swept"
        end
      end
      
      context "Player chooses to NOT SWEEP the cards in the pot" do
        context "Flipped card is NOT a numbered card" do
          context "Flipped card is a 'REVERSE'" do
            it "Evaluates the Mark as 'REVERSE''" do
              mark = Mark.new('h', 7, "Reverse")
              mark.evaluate.should == "Reverse"
            end
          end
          context "Flipped card is a 'GIVE 2 CARDS'" do
            it "Evaluates the Mark as 'GIVE 2 CARDS''" do
              mark = Mark.new('h', 7, "Give 2")
              mark.evaluate.should == "Give 2"
            end
          end
          context "Flipped card is a 'GIVE ME 2 CARDS'" do
            it "Evaluates the Mark as 'GIVE ME 2 CARDS''" do
              mark = Mark.new('h', 7, "Give Me 2")
              mark.evaluate.should == "Give Me 2"
            end
          end
          
          context "Flipped card is a 'SUCK IT NERDS'" do
            it "Evaluates the Mark as 'SUCK IT NERDS''" do
              mark = Mark.new('h', 7, "Suck It Nerds")
              mark.evaluate.should == "Suck It Nerds"
            end
          end
          
          
           context "Flipped card is a 'Roshambo'" do
            it "Evaluates the Mark as 'Roshambo" do
              mark = Mark.new('h', 7, "Roshambo")
              mark.evaluate.should == "Roshambo"
            end
          end
          
           context "Flipped card is a 'Stack Swap'" do
            it "Evaluates the Mark as 'Stack Swap'" do
              mark = Mark.new('h', 7, "Stack Swap")
              mark.evaluate.should == "Stack Swap"
            end
          end
          
           context "Flipped card is a 'War'" do
            it "Evaluates the Mark as 'War'" do
              mark = Mark.new('h', 7, "War")
              mark.evaluate.should == "War"
            end
          end
          
          
          
          
          
          
          
          
          
          
        end
        
        context "Flipped card IS a numbered card" do
          context "Current_card > Flipped Card" do
            context "Player's Guess was Higher" do      
              it "Evaluates the Mark as 'CORRECT'" do
                mark = Mark.new('h', 7, 8)
                mark.evaluate.should == "Correct"
              end
            end
            context "Player's Guess was Lower" do      
              it "Evaluates the Mark as 'WRONG'" do
                mark = Mark.new('l', 7, 8)
                mark.evaluate.should == "Wrong"
              end
            end
          end
          context "Current_card < Flipped Card" do
            context "Player's Guess was Higher" do      
              it "Evaluates the Mark as 'WRONG'" do
                mark = Mark.new('h', 7, 6)
                mark.evaluate.should == "Wrong"
              end
            end
            context "Player's Guess was Lower" do      
              it "Evaluates the Mark as 'CORRECT'" do
                mark = Mark.new('l', 7, 6)
                mark.evaluate.should == "Correct"
              end
            end
          end
        
          context "Current card = Flipped card" do
            context "Player's guess was higher" do      
              it "Evaluates the Mark as 'SAME'" do
                mark = Mark.new('h', 7, 7)
                mark.evaluate.should == "Same"
              end
            end
            context "Player's guess was lower" do      
              it "Evaluates the Mark as 'SAME'" do
                mark = Mark.new('l', 7, 7)
                mark.evaluate.should == "Same"
              end
            end
          end
        end      
      end
      
      
    end

    
    
  end
end
