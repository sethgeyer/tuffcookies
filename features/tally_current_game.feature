Feature: Keep Track of Current Number of Correct Guesses

As the dealer flips over cards and the current player guesses
correctly (or incorrectly), the game should keep track of the 
current number of correct guesses in a row.

  Scenario Outline: track correct guesses
    Given the current number of correct guesses is "<tally>"
    When the answer is "<answer>" 
    Then the correct guesses should be "<new_tally>"
    
    Scenarios: no matches
    | tally | answer | new_tally | 
    | 1     | correct| Consecutive correct guesses: 2         |
    | 0     | correct| Consecutive correct guesses: 1         |
    | 3     | correct| Consecutive correct guesses: 4         |
    | 0     | wrong  | Consecutive correct guesses: 0         |
    | 2     | wrong  | Consecutive correct guesses: 0         |
    | 3     | same   | Consecutive correct guesses: 3         |
    | 4     | same   | Consecutive correct guesses: 4         |
    
    
