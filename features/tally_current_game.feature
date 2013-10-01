Feature: Keep Track of Current Number of Correct Guesses

As the dealer flips over cards and the current player guesses
correctly (or incorrectly), the game should keep track of the 
current number of correct guesses in a row.

  Scenario Outline: track correct guesses
    Given the flipped_card is "<flipped_card>"
    And the current number of correct guesses is "<current_correct_guess_tally>"
    When the answer of higher is "<answer>" 
    Then the correct guesses should be "<new_correct_guess_tally>"
    
    Scenarios: correct_answer
| flipped_card | current_correct_guess_tally | answer | new_correct_guess_tally                | 
| 8            | 1                           | correct| Consecutive correct guesses: 2         |
| 8            | 0                           | correct| Consecutive correct guesses: 1         |

    Scenarios: wrong_answer
| flipped_card | current_correct_guess_tally | answer | new_correct_guess_tally                | 
| 6            | 1                           | wrong  | Consecutive correct guesses: 0         |
| 6            | 0                           | wrong  | Consecutive correct guesses: 0         |
| 6            | 3                           | wrong  | Consecutive correct guesses: 0         |

    Scenarios: same_answer
| flipped_card | current_correct_guess_tally | answer | new_correct_guess_tally                | 
| 7            | 1                           | same   | Consecutive correct guesses: 1         |
| 7            | 0                           | same   | Consecutive correct guesses: 0         |


    
    
