def output
  @output ||= Output.new
end


class Output
  def messages
    @messages ||= []
  end
  
  def puts(message)
    messages << message
  end
end


#__________START A GAME
Given(/^I am not yet playing$/) do
end

When(/^I start a game$/) do
  game = TuffCookie::Game.new(output)
  game.start(7)
end

Then(/^I should see "(.*?)"$/) do |message|
  output.messages.should include(message)
end

#__________SUBMIT A MARK

Given(/^the current card is "(.*?)"$/) do |current_card|
  @game = TuffCookie::Game.new(output)
  @game.start(current_card) 
end

When(/^the flipped card is "(.*?)"$/) do |flipped_card|
  @game.flipped_card(flipped_card)
end

And(/^I guess "(.*?)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "(.*?)"$/) do |answer|
  output.messages.should include(answer)
end

#________TALLY CORRECT GUESSES

Given(/^a game has started$/) do
end

When(/^the number of previous correct guesses is "(.*?)"$/) do |previous_correct_guesses|
  @game = TuffCookie::Game.new(output)
  @game.tally(previous_correct_guesses)
end

And(/^an answer is "(.*?)"$/) do |answer|
  output.messages.include?(answer)
end

Then(/^the current correct guesses should be "(.*?)"$/) do |current_correct_guesses|
  output.messages.should include(current_correct_guesses)
end


























