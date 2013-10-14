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
          game.players[i].score.should == 0
          
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
      it "identifies the next card the dealer will flip" do
        game.numbered_cards = [8, 2, 4, 5]
        game.dealer_flips_card.should == 8
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
        game.players[0].score = 0
        game.players[1].score = 1
        game.players[2].score = 2
        game.players[3].score = 3
        
      end
      context "the evaluation of the current players guess is 'swept'" do
        context "and the consecutive correct guesses >= 3" do
          it "adds the consecutive guess cards to the current player's score" do
            game.players[0].score = 5
            game.current_correct_guess_tally = 3
            game.update_score("swept")
            game.players[0].score.should == 8
          end
        end
      end
      context "the evaluation of the current players guess is 'wrong'" do
        it "adds the consecutive guess cards to the previous player's score" do
          game.players[0].score = 5
          game.players[3].score = 2
          game.current_correct_guess_tally = 1
          game.update_score("wrong")
          game.players[3].score.should == 3
        end
      end
    
    end
  
  
  
  
  
  
  
  end
end
         
      



















