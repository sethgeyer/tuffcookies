Feature: Sweep Cards or Keep Playing

As the player once there are 3 consecutive correct guesses,
I want to be able to take the cards into my pile of "winnings".
Once I have swept the cards into my pile of winnings, I should be shown my updated
score.

  Scenario Outline: track correct guesses
    Given the player's current score is "<current_score>" 
    And the current_correct_guess_tally is "<current_correct_guess_tally>" 
    When my choice is "<guess>"
    And my current_correct_guess_tally is greater than "<min>"
    Then the player's new_score should be "<new_score>"
    
    Scenarios: Choosing to sweep cards
| current_score | current_correct_guess_tally | guess | min | new_score | 
| 1             | 5                           | s     | 3   | 4         |
| 0             | 3                           | s     | 3   | 3         |
    
