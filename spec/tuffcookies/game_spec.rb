require 'spec_helper'

module TuffCookie
  describe Game do
    let(:output)  {double("output").as_null_object }
    let(:game) {Game.new(output) }
    
    describe "#INTRODUCTION and Name Request" do
      it "asks a user for his/her name" do
         output.should_receive(:puts).with("Welcome to Tuff Cookies!  What's your name?")
         game.start(7, "Seth")
      end
    end
  
    describe "#START the Game" do
      before(:each) { game.start(7, "Seth") }
      it "CREATES DECK for the game" do
        game.total_cards.should == 60
      end
      
      it "CREATES CORRECT GUESS TALLY instance " do
        game.tally.should be_an_instance_of CorrectGuessTally     
      end
      
      
      
      it "CREATES LIST OF PLAYERS and an instance of each" do
        game.array_of_players.should == ["Seth", "Noah", "George", "Anne"] 
        for i in (0..game.array_of_players.size - 1)
          game.players[i].name.should == game.array_of_players[i]
          #game.players[i].score.should == 0
          game.players[i].won_cards.should == []
          
        end
      end
      

      it "GREETS the player and establishes the playing order" do
        output.should_receive(:puts).with("Welcome Seth! The starting playing order is: Seth, Noah, George, Anne")
        game.start(7, "Seth")
      end
    
      it "ASSIGNS CURRENT CARD" do
        game.current_card.should == 7
      end


    end
 
    describe "#GUESS" do
      before(:each) do 
      game.start(7, "Seth")
      end
      it "creates a new Mark instance " do
        game.guess('h')
        game.current_card = 7
        game.flipped_card = 8 
        game.mark.should be_an_instance_of Mark     
      end

      it "creates the new current card" do
        game.guess('h')
        game.current_card.should == game.flipped_card         
      end 
    
      it "tells the player the answer to their guess and consecutive correct guesses" do
        # Need test
        # Need test
      end 
    
      it "tells who the next player is and the current card in play" do
        # Need test
        # Need test
      end 
    end
    
    describe "#DEALER FLIPS CARD" do
      it "it draws the next card from the dealers deck" do
        game.numbered_cards = [8, 2, 4, 5]
        game.dealer_flips_card.should == 8
      end
    end 
          
    describe "#ASSIGN NEXT TURN" do
      before(:each) do
        game.start(7, "Seth")
        game.guess('h')
      end
      context "the evaluation of the current players guess is 'correct'" do
        it "stays with the same player" do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("correct")
            game.current_player.name.should == game.players[i].name
          end
        end
      end
      context "the evaluation of the current players guess is 'wrong'" do
        it "the next player is assigned" do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("wrong")
            if i == 3
              game.current_player.name.should == game.players[0].name
             else
              game.current_player.name.should == game.players[i+1].name
            end
          end
        end
      end
      context "the evaluation of the current players guess is 'same'" do
        it "the next player is assigned" do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("same")
            if i == 3
              game.current_player.name.should == game.players[0].name
            else
               game.current_player.name.should == game.players[i+1].name
            end
          end
        end
      end
      context "the evaluation of the current players guess is 'swept'" do
        it "the next player is assigned" do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("swept")
            if i == 3
              game.current_player.name.should == game.players[0].name
            else
              game.current_player.name.should == game.players[i+1].name
            end
          end
        end
      end
    end  
    describe "#UPDATE SCORE" do
      before(:each) do
        game.start(7, "Seth")
        game.players[0].won_cards = []
        game.players[3].won_cards = [1,2,3]
        game.numbered_cards = [7, 3, 2]
        game.flipped_card = 12
        game.tally.pot = [6,7,8]
      end
      context "the evaluation of the current players guess is 'swept'" do
        before(:each) do
          game.current_correct_guess_tally = 3
          game.update_score("swept")
        end        
        context "and the consecutive correct guesses >= 3" do
          it "adds the pot to the current player's 'won cards" do
            
            game.players[0].won_cards.size.should == 3
          end
          it "resets the pot to include the flipped card not yet played" do
            game.tally.pot.should == [12]
          end
        end
      end
      context "the evaluation of the current players guess is 'wrong'" do
        before(:each) do
          game.update_score("wrong")
        end        
        it "adds the pot to the current player's 'won cards" do
          game.players[3].won_cards.size.should == 6
        end
        it "resets the pot to include first card in numbered_cards" do
          game.tally.pot.should == [7]
        end
      end
    end
  describe "#DECIDE TO FLIP ANOTHER CARD" do
    before(:each) do
      game.numbered_cards = [4,5,6]
      game.flipped_card = 9
    end
    context "The evaluation of the current players guess is 'swept'" do
      it "the dealer flips another card to begin a new round of guessing" do
        game.decide_to_flip_another_card('swept')
        game.flipped_card.should == 9
      end
    end
    context "The evaluation of the current players guess is 'wrong'" do
      it "the dealer flips another card to begin a new round of guessing" do
        game.decide_to_flip_another_card('wrong')
        game.flipped_card.should == 4
      end
    end
  end
  
  
  
  
  
  
  end
end
         
      



















