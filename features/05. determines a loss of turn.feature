Feature: Determine the next player

CONNEXTRA FORMAT:  As a "role"; I want "feature"; So that "business value"

As a player, after I make a guess
I want to know that it is still my turn
So I that I know whether I should keep guessing 

  Scenario Outline: 
    Given I am the "<current_player>"
    When the flippedcard is "<flipped_card>"
    And the persons guess is "<guess>" 
    Then I should see that its "<next_player>"
    
    
  Scenarios: Determine the next player
| current_player | flipped_card | guess | next_player |  
| Seth           | 9            | h     | Seth's Turn |
| Seth           | 8            | s     | Bill's Turn |
| Seth           | 6            | h     | Bill's Turn |
| Seth           | 6            | h     | Bill's Turn |
