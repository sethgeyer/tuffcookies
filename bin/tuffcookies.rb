#!/user/bin/evn ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tuffcookies'


game = TuffCookie::Game.new(STDOUT)

player_name = gets.chomp

game.start(game.numbered_cards.shift, player_name)


while game.numbered_cards.size > 0
  game.dealer_flips_card
  guess = gets.chomp
  game.guess(guess, game.current_correct_guess_tally)
end

=begin

##### the below referenced code needs to be tested.
while true 
  if game.current_player.name == player_name
    print "---------------------------------------------"
    guess = gets.chomp
    game.guess(guess, game.current_correct_guess_tally)
  else
    if game.current_correct_guess_tally > 2 && (game.current_card < 10 && game.current_card > 5) 
      guess = 's'
      print guess
      game.guess(guess, game.current_correct_guess_tally)
    else
      if game.current_card > 9
        guess = 'l'
      
      else
        guess = 'h'
      end
      print guess
      sleep(5)
      game.guess(guess, game.current_correct_guess_tally)
      
     
    end
  end
end

=end


