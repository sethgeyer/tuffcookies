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
    | 1                        | correct| 2     |
    | 0                        | correct| 1     |
    | 3                        | correct| 4     |
    | 0                        | wrong  | 0     |
    | 2                        | wrong  | 0     |
    | 3                        | same   | 3     |
    | 4                        | same   | 4     |
    
    
