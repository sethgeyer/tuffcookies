
require 'spec_helper'

module TuffCookie
  describe CurrentPlayer do
    let(:test_double)  {double("testdouble").as_null_object }
    let(:game) {Game.new(test_double) }
    describe "Reassign Turn" do
      before(:each) do 
          game.start(7, "Seth") 
          game.dealer_flips_card(8)
          @plug_name = "Anne" #game.list_of_players[rand(0..3)] 
          game.current_player = CurrentPlayer.new(@plug_name, game.list_of_players)
          if game.list_of_players.index(@plug_name) == game.list_of_players.size - 1 
             @next_player = game.list_of_players[0]
          else
            @next_player = game.list_of_players[game.list_of_players.index(@plug_name).to_i + 1]
          end
      end
       context "when the current player's 'guess' results in 'correct'" do
         it "should stay with the current player" do
           game.guess('h', 4)
           game.current_player.player_name.should == @plug_name
         end       
       end     
      context "when the current player's 'guess' results in 'swept'" do
        it "should move to next player" do
          game.guess('s', 4)
          game.current_player.player_name.should == @next_player
        end       
      end    
      context "when the current player's 'guess' results in 'wrong'" do
        it "should move to next player" do
          game.guess('l', 4)
          game.current_player.player_name.should == @next_player
        end       
      end    
      context "when the current player's 'guess' results in 'same'" do
        it "should move to next player" do
          game.guess('l', 4)
          game.current_player.player_name.should == @next_player
        end       
      end    


    end
  end
end





























