Feature: Keep Track of Current Number of Correct Guesses

As the dealer flips over cards and the current player guesses
correctly (or incorrectly), the game should keep track of the 
current number of correct guesses in a row.

  Scenario Outline: track correct guesses
    Given a game has started
    When the number of previous correct guesses is "<previous correct guesses>" 
    And an answer is "<answer>"
    Then the current correct guesses should be "<total>"
    
    Scenarios: no matches
    | previous correct guesses | answer | total | 
    | 1                        | correct| yep |
    | 0                        | correct| yep |
    | 3                        | correct| yep |
    | 0                        | wrong  | yep |
    | 2                        | wrong  | yep |
    | 3                        | same   | yep |
    | 4                        | same   | yep |
    
    
