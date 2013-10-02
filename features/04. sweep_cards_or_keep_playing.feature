Feature: Sweep Cards or Keep Playing

As the player once there are 3 consecutive correct guesses,
I want to be able to take the cards into my pile of "winnings".
Once I have swept the cards into my pile of winnings, I should be shown my updated
score.

  Scenario Outline: track correct guesses
    Given the player is "<current_player>"
    And the player's current score is "<current_score>" 
    And the current_correct_guess_tally is "<current_correct_guess_tally>" 
    When my choice is "<guess>"
    Then the player's new_score should be "<new_score>"
    
  Scenarios: Choosing to sweep cards
| current_player| current_score | current_correct_guess_tally | guess | new_score               | 
| Seth          | 1             | 5                           | s     | Current Score: 6        |
| Seth          | 0             | 3                           | s     | Current Score: 3        |
| Seth          | 4             | 2                           | s     | Current Score: 4        |
| Seth          | 1             | 5                           | h     | Current Score: 1        |    
