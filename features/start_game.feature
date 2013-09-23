Feature: Start a Game of Tuff Cookies

I want to start a new game of tuff cookies
  
  Scenario: Start the game
  Given I am not yet playing
  When I start a game
  Then I should see "Welcome to Tuff Cookies!"
  And I should see "err... I mean NGDubs!"
  And I should see "In any case, the Card in Play is a 7."
  And I should see "Higher (h) or Lower (l)?"
  
  
  