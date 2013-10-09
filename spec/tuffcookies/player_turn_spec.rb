require 'spec_helper'

module TuffCookie
  describe PlayerTurn do
    let(:output)  {double("output").as_null_object }
    let(:game) {Game.new(output) }
    describe "#NEW PlayerTurn" do
      it "creates a player's turn instance w/ 'name' and 'score' as a attribute" do
        current_player = PlayerTurn.new("Seth", 5)
        current_player.name.should == "Seth"
        current_player.score.should == 5    
      end
    end
    
 #    describe "#ASSIGN TURN" do
#       context "current players guess is correct" do
#         it "keeps the current player as the current player" do
#           game.start(7, "Seth")
#           game.evaluation == "correct"
#           game.current_player.name.should == "Seth"
#         end        
#       end
#       context "current players guess is wrong" do
#         it "creates a new current player" do
#           game.start(7, "Seth")
#           game.guess('h')
#           game.current_player.name.should == "Noah"
#         
#         end        
#       end 
#     end
    
    
    
    
  end
end
         
      
