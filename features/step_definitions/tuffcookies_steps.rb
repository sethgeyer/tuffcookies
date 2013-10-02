class Output
  def messages
    @messages ||= []
  end
  
  def puts(message_passed_from_game_rb)
    messages << message_passed_from_game_rb
  end
end

def output_item
  @output ||= Output.new
end

#___________START GAME
Given(/^I am not yet playing$/) do
end

When(/^I start a game$/) do
game = TuffCookie::Game.new(output_item)
game.start(7, "Seth")
end

Then(/^I should see "(.*?)"$/) do |welcome_messages|
output_item.messages.should include(welcome_messages)
end

#__________SUBMIT A GUESS

Given(/^the current card is "(.*?)"$/) do |current_card|
  @game = TuffCookie::Game.new(output_item)
  @game.start(7)
  @game.current_card == current_card 
end

When(/^the flipped card is "(.*?)"$/) do |flipped_card|
  @game.dealer_flips_card(flipped_card)
end

And(/^I guess "(.*?)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "(.*?)"$/) do |answer|
  output_item.messages.should include(answer)
end


#________TALLY CORRECT GUESSES

Given(/^the flipped_card is "(.*?)"$/) do |flipped_card|
 @game = TuffCookie::Game.new(output_item)
 @game.start(7)
 @game.dealer_flips_card(flipped_card)
end

And(/^the current number of correct guesses is "(.*?)"$/) do |current_correct_guess_tally|
 @game.guess('h', current_correct_guess_tally)
end

When(/^the answer of higher is "(.*?)"$/) do |answer|
  output_item.messages.should include(answer)
end

Then(/^the correct guesses should be "(.*?)"$/) do |new_correct_guess_tally|
  output_item.messages.should include(new_correct_guess_tally)
end


#_________ SWEEP CARDS OR KEEP PLAYING

Given(/^the player is "(.*?)"$/) do |current_player|
  @game = TuffCookie::Game.new(output_item)
  @game.start(7)
  @game.dealer_flips_card(5)
  
  #@current_player = TuffCookie::CurrentPlayer.new(current_player)
end

And(/^the player's current score is "(.*?)"$/) do |current_score|
  @game.active_player.current_score = current_score.to_i
  
end

And(/^the current_correct_guess_tally is "(.*?)"$/) do |current_correct_tally|
  @game.current_correct_guess_tally = current_correct_tally
end


When(/^my choice is "(.*?)"$/) do |guess|
  @game.guess(guess, @game.current_correct_guess_tally)
end


Then(/^the player's new_score should be "(.*?)"$/) do |new_score|
  output_item.messages.should include(new_score)
end


#____________ Determine the next player
Given(/^I am the "(.*?)"$/) do |current_player|
  @game = TuffCookie::Game.new(output_item)
  @game.start(7, current_player)
  @game.dealer_flips_card(5)
end

When(/^my selection is "(.*?)"$/) do |guess|
  @game.guess(guess)
end

And(/^the dealer's answer is "(.*?)"$/) do |answer|
  @game.evaluation = answer
end

Then(/^I should see that its "(.*?)"$/) do |next_player|
  output_item.messages.should include(next_player)
end















