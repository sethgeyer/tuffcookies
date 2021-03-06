require 'spec_helper'

module TuffCookie
  describe Game do
    let(:output)  {double("output").as_null_object }
    let(:game) {Game.new(output) }
    
    describe "#INTRODUCTION and Name Request" do
      it "Asks the player for his name" do
         output.should_receive(:puts).with("Welcome to Tuff Cookies!  What's your name?")
         game.start(7, "Seth")
      end
    end
  
    describe "#START the Game" do
      before(:each) { game.start(7, "Seth") }
      it "Creates deck for the game" do
        game.total_cards.should == 68
      end
                
     
      it "Creates a 'CorrectGuessTally' instance " do
        game.tally.should be_an_instance_of CorrectGuessTally     
      end
      it "Creates a list of players and an instance of Player for each" do
        game.array_of_players.should == ["Seth", "Noah", "George", "Anne"] 
        for i in (0..game.array_of_players.size - 1)
          game.players[i].name.should == game.array_of_players[i]
          game.players[i].won_cards.should == []  
        end
      end
      it "Greets the player and establishes the initial playing order" do
        output.should_receive(:puts).with("Welcome Seth! The starting playing order is: Seth, Noah, George, Anne")
        game.start(7, "Seth")
      end
      it "Sets the 'current card' equal to the 'start card'" do
        game.current_card.should == 7
      end
    end


    describe "#PLAYER_CHOICES" do
      before(:each) do 
        game.start(7, "Seth") 
      end
      
      context "There are < 3 Correct Consecutive Guesses" do
        it "returns 'Higher(h) or Lower(l)?'" do
          game.tally.new_correct_guess_tally = 2
          game.player_choices.should == "Higher(h) or Lower(l)?" 
        end
      end
      context "There are 3 or more Correct Consecutive Guesses" do
        it "returns 'Higher(h) or Lower(l) or Sweep(s)?'" do
          game.tally.new_correct_guess_tally = 3
          game.player_choices.should == "Higher(h) or Lower(l) or Sweep(s)?" 
        end
      end
    end


    
    describe "#GUESS" do
      before(:each) do 
        game.start(7, "Seth")
        game.flipped_card = 8 
        game.guess('h')
      end
      it "Creates a new Mark instance " do
        game.mark.should be_an_instance_of Mark     
      end
      it "Sets the current card equal to the flipped card once the guess has been evaluated" do
        game.current_card.should == game.flipped_card         
      end 
      it "Tells the player the answer to their guess and consecutive correct guesses" do
        # Need test
        # Need test
      end 
      it "Tells who the next player is and the current card in play" do
        # Need test
        # Need test
      end 
    end
    
    describe "#DEALER FLIPS CARD" do
      it "Draws the next card from the dealers shuffled deck" do
        game.numbered_cards = [8, 2, 4, 5]
        game.dealer_flips_card.should == 8
      end
    end 
          
    describe "#ASSIGN NEXT TURN" do
      before(:each) do
        game.start(7, "Seth")
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'NO_GUESS'" do
          context "The current card in play is a 'REVERSE'" do
            it "Reverses order of play to the previous player" do 
              game.current_card = "Reverse"
              game.current_player = game.assign_next_turn("No Guess")
              game.current_player.name.should == "Anne"
            end
          end
          context "The current card in play is NOT 'REVERSE'" do
            context "The current card is 'GIVE 2'" do
              it "Assigns the next turn to the current player" do 
                game.current_card = "Give 2"
                game.current_player = game.assign_next_turn("No Guess")
                game.current_player.name.should == "Seth"
              end
            end
            context "The current card is 'GIVE ME 2'" do
              it "Assigns the next turn to the current player" do 
                game.current_card = "Give Me 2"
                game.current_player = game.assign_next_turn("No Guess")
                game.current_player.name.should == "Seth"
              end
            end
            
            context "The current card is 'SUCK IT NERDS'" do
              it "Assigns the next turn to the current player" do 
                game.current_card = "Suck It Nerds"
                game.current_player = game.assign_next_turn("No Guess")
                game.current_player.name.should == "Seth"
              end
            end
            
            context "The current card is 'Roshambo'" do
              it "Assigns the next turn to the current player" do 
                game.current_card = "Roshambo"
                game.current_player = game.assign_next_turn("No Guess")
                game.current_player.name.should == "Seth"
              end
            end
            context "The current card is 'Stack Swap'" do
              it "Assigns the next turn to the current player" do 
                game.current_card = "Stack Swap"
                game.current_player = game.assign_next_turn("No Guess")
                game.current_player.name.should == "Seth"
              end
            end
            context "The current card is 'War'" do
              it "Assigns the next turn to the current player" do 
                game.current_card = "War"
                game.current_player = game.assign_next_turn("No Guess")
                game.current_player.name.should == "Seth"
              end
            end
            context "The current card in play is a 'Skip'" do
            it "Assigns the next turn to the next player in order" do 
              game.current_card = "Skip"
              game.current_player = game.assign_next_turn("No Guess")
              game.current_player.name.should == "Noah"
            end
          end

          end
      end 
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'REVERSE'" do
        it "Reverses order of play to the previous player" do
          game.current_player = game.assign_next_turn("Reverse")
          game.current_player.name.should == "Anne"
        end
      end
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Skip'" do
        it "Assigns the next turn to the next player in order" do
          game.current_player = game.assign_next_turn("Skip")
          game.current_player.name.should == "Noah"
        end
      end
      
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'CORRECT'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Correct")
            game.current_player.should == game.players[i]
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'GIVE_2'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Give 2")
            game.current_player.should == game.players[i]
          end
        end
      end
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'GIVE_ME_2'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Give Me 2")
            game.current_player.should == game.players[i]
          end
        end
      end
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SUCK IT NERDS'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Suck It Nerds")
            game.current_player.should == game.players[i]
          end
        end
      end
      
      
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Roshambo'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Roshambo")
            game.current_player.should == game.players[i]
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Stack Swap'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Stack Swap")
            game.current_player.should == game.players[i]
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'War'" do
        it "Assigns the next turn to the current player" do
        #game.guess('h')
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("War")
            game.current_player.should == game.players[i]
          end
        end
      end
      
      
      
      
      
      
      
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'WRONG'" do
        it "Assigns the next turn to the next player in order" do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Wrong")
            if i == 3
              game.current_player.should == game.players[0]
             else
              game.current_player.should == game.players[i+1]
            end
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SAME'" do
        it "Assigns the next turn to the next player in order." do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Same")
            if i == 3
              game.current_player.should == game.players[0]
            else
               game.current_player.should == game.players[i+1]
            end
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SWEPT'" do
        it "Assigns the next turn to the next player in order." do
          for i in (0..3)
            game.current_player = game.players[i]
            game.current_player = game.assign_next_turn("Swept")
            if i == 3
              game.current_player.should == game.players[0]
            else
              game.current_player.should == game.players[i+1]
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
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SWEPT'" do
        before(:each) do
          game.current_correct_guess_tally = 3
          game.update_score("Swept")
        end        
        context "The consecutive correct guesses >= 3" do
          it "Adds the pot to the current player's 'won' cards" do
            game.players[0].won_cards.size.should == 3
          end
          it "Resets the pot to include the flipped card about to be played" do
            game.tally.pot.should == [12]
          end
        end
      end
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'WRONG'" do
        before(:each) do
          game.update_score("Wrong")
        end        
        it "Adds the pot to the current player's 'won' cards" do
          game.players[3].won_cards.size.should == 6
        end
        it "Resets the pot to include the flipped card about to be played" do
          game.tally.pot.should == [7]
        end
      end
    
      context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Give 2'" do
        before(:each) do
          game.current_player = game.players[3]
        end
        context "The current_player has at least 2 cards to give" do
          before(:each) do
            game.current_player.won_cards = [4, 5, 6, 7, 8, 9]
          end  
          
          context "There is only ONE player with the fewest number of cards" do
            before(:each) do
              game.players[0].won_cards = [4, 5, 6]
              game.players[1].won_cards = [3, 2]
              game.players[2].won_cards = [4, 6, 7, 8]
              game.update_score("Give 2")
            end
            it "takes 2 cards from the current players pile of won cards" do
              game.current_player.won_cards.size.should == 4
            end
            it "gives the 2 cards to the ONE player with the fewest won cards" do
              game.players[1].won_cards.size.should == 4
            end
          end
#           context "There are MULTIPLE players with the fewest number of cards" do
#             before(:each) do
#               game.players[0].won_cards = [4]
#               game.players[1].won_cards = [3]
#               game.players[2].won_cards = [9]
#               game.update_score("Give 2")
#             end
#             it "gives the 2 cards to one of the players based on random selection" do
#               game.receiver = game.players[1]
#               game.players[1].won_cards.size.should == 3
#             end
#           end
           context "The current player is the one with the fewest number of cards" do
          end
        end
        
        context "The current_player does NOT HAVE 2 cards to give" do
        end  
      end        
    end
    
  describe "#DECIDE TO FLIP ANOTHER CARD" do
    before(:each) do
      game.numbered_cards = [4,5,6]
      game.current_card = 3
      game.flipped_card = 9
    end
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SWEPT'" do
      it "Uses the existing not-yet-flipped card as the 'flipped card'" do
        game.decide_to_flip_another_card('Swept')
        game.flipped_card.should == 9
      end
    end
    
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Correct'" do
      it "Dealer flips a new card from the deck" do
        game.decide_to_flip_another_card('Correct')
        game.flipped_card.should == 9
      end
    end
    
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'WRONG'" do
      it "Dealer flips a new card from the deck" do
        game.decide_to_flip_another_card('Wrong')
        game.flipped_card.should == 4
      end
    end
    
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'REVERSE'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Reverse")
        game.flipped_card.should == 3
      end
    end
    
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'GIVE_2'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Give 2")
        game.flipped_card.should == 3
      end
    end
    
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'GIVE_ME_2'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Give Me 2")
        game.flipped_card.should == 3
      end
    end

    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'SUCK IT NERDS'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Suck It Nerds")
        game.flipped_card.should == 3
      end
    end
    
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Roshambo'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Roshambo")
        game.flipped_card.should == 3
      end
    end
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Stack Swap'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Stack Swap")
        game.flipped_card.should == 3
      end
    end
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'War'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("War")
        game.flipped_card.should == 3
      end
    end
    context "The evaluation of the Mark(guess, current_card, flipped_card) is 'Skip'" do
      it "Uses the previous 'numbered' card as the 'flipped_card'" do
        game.decide_to_flip_another_card("Skip")
        game.flipped_card.should == 3
      end
    end
    
    
    
    
    
  end
  
  
  
  
  
  
  end
end
         
      



















