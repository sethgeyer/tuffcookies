
require 'spec_helper'

module TuffCookie
  describe CurrentPlayer do
    let(:test_double)  {double("testdouble").as_null_object }
    let(:game) {Game.new(test_double) }
    describe "Reassign Turn" do
      before(:each) do 
          game.start(7, "Seth") 
          game.dealer_flips_card(8) 
          
      end
  #     context "when the player's 'guess' is 'correct'" do
#         it "should stay with the current player" do
#           game.guess('h', 4)
#           game.players_turn.should == "Seth"
#         end       
#       end   
#       context "when the player's 'guess' is 'swept'" do
#         it "should move to next player" do
#           game.guess('s', 4)
#           game.players_turn.should == "George" #game.players[game.players.index(game.players_turn)]
#           #game.players_turn.should == CurrentPlayer.new(game.players_turn).player_name
#         end       
#       end    
#       context "when the player's 'guess' is 'wrong'" do
#         it "should move to next player" do
#           game.guess('l', 4)
#           game.players_turn.should == "George" #game.players[game.players.index(game.players_turn)]
#           #game.players_turn.should == CurrentPlayer.new(game.players_turn).player_name
#         end       
#       end    
#       context "when the player's 'guess' is 'same'" do
#         it "should move to next player" do
#           game.guess('l', 4)
#           game.players_turn.should == "George" #game.players[game.players.index(game.players_turn)]
#           #game.players_turn.should == CurrentPlayer.new(game.players_turn).player_name
#         end       
#       end    



    end
  end
end





























