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

=begin
#________TALLY CORRECT GUESSES


Given(/^a game has started$/) do
  @game = TuffCookie::Game.new(output_item)
  @game.start(7, "Seth")
  @game.dealer_flips_card(8)
  @game.guess('h')
  @tally = TuffCookie::Tally.new
end

When(/^the number of previous correct guesses is "(.*?)"$/) do |previous_correct_guesses|
  @tally.previous_correct_guesses == previous_correct_guesses
end

And(/^an answer is "(.*?)"$/) do |answer1|
  output_item.messages.include?(answer1)
end

Then(/^the current correct guesses should be "(.*?)"$/) do |total|
  output_item.messages.should include(total)
end
=end















