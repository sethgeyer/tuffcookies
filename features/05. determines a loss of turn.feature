Feature: Determine the next player

CONNEXTRA FORMAT:  As a "role"; I want "feature"; So that "business value"

As a player, after I make a guess
I want to know that it is still my turn
So I that I know whether I should keep guessing 

  Scenario Outline: 
    Given I am the "<current_player>"
    When the dealer's answer is "<answer>"
    Then I should see that its "<next_player>"
    
    
  Scenarios: Determine the next player
| current_player| answer     | next_player |  
| Seth          | correct    | Seth's Turn |
| Seth          | wrong      | Bill's Turn |
| Seth          | same       | Bill's Turn |
| Seth          | swept      | Bill's Turn |
