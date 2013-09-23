Feature: Card is Flipped and User Submits a Guess

The dealer flips the first card of the deck 
and the user should submit a guess.
 
  
  Scenario Outline: submit guess
    Given the current card is "<current card>"
    When the flipped card is "<flipped card>"
    And I guess "<guess>"
    Then the mark should be "<answer>"
    
    Scenarios: no matches
    | current card | flipped card | guess     | answer |
    | 7            | 8            | h         | correct|
    | 7            | 7            | h         | same   |
    | 7            | 6            | h         | wrong  |
    | 7            | 8            | l         | wrong  |
    | 7            | 7            | l         | same   |
    | 7            | 6            | l         | correct|