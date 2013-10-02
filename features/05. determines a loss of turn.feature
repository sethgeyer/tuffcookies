Feature: Determine the next player

CONNEXTRA FORMAT:  As a "role"; I want "feature"; So that "business value"

As a player, after I make a guess
I want to know that it is still my turn
So I that I know whether I should keep guessing 

  Scenario Outline: 
    Given I am the "<current_player>"
    When my selection is "<guess>"
    And the dealer's answer is "<answer>"
    Then I should see that its "<next_player>"
    
    
  Scenarios: Determine the next player
| current_player| guess | answer     | next_player |  
| Seth          | h     | correct    | Seth's Turn |
| Seth          | h     | wrong      | Bill's Turn |
| Seth          | h     | same       | Bill's Turn |
| Seth          | s     | correct    | Bill's Turn |
| Seth          | s     | wrong      | Bill's Turn |
| Seth          | s     | same       | Bill's Turn |