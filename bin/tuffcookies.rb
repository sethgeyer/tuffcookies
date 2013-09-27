#!/user/bin/evn ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tuffcookies'

game = TuffCookie::Game.new(STDOUT)

player_name = gets.chomp

game.start(rand(1..15), player_name)
game.dealer_flips_card

#at_exit do
#  puts "The next card was a #{flipped_card}"
#end 


while guess = gets.chomp
 game.guess(guess)
end