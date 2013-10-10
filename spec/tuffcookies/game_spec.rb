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
        game.player0.name.should == "Seth"
        game.player1.name.should == "Noah"
        game.player2.name.should == "George"
        game.player3.name.should == "Anne"
      end
      
      it "CREATES SCORE for each player" do
        game.player0.score.should == 0
        game.player1.score.should == 0
        game.player2.score.should == 0
        game.player3.score.should == 0
      end

      it "GREETS the player and establishes the playing order" do
        output.should_receive(:puts).with("Welcome Seth! The starting playing order is: Seth, Noah, George, Anne")
        game.start(7, "Seth")
      end
    
      it "ASSIGNS CURRENT CARD" do
        game.current_card.should == 7
      end

=begin
      it "ASSIGNS TURN to the player" do
        
        
        game.current_player.should be_an_instance_of PlayerTurn
        output.should_receive(:puts).with("#{game.current_player.name.upcase}'s Turn: The Card in Play is a 7.... Higher(h) or Lower(l)?")  
        game.start(7, "Seth")
        game.current_player.score.should == game.player0.score
      

      end    
=end    
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

  
  
  end
end
         
      
