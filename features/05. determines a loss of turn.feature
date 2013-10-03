Feature: Determine the next player

CONNEXTRA FORMAT:  As a "role"; I want "feature"; So that "business value"

As a player, after I make a guess
I want to know that it is still my turn
So I that I know whether I should keep guessing 

  Scenario Outline: 
    Given I am the "<current_player>"
    And the players are "<list_of_players>"
    When the flippedcard is "<flipped_card>"
    And the persons guess is "<guess>" 
    Then I should see that its "<next_player>"
    
    
  Scenarios: Determine the next player
| current_player | list_of_players                  | flipped_card | guess | next_player |  
| Seth           | Seth, George, Anne, Noah | 9            | h     | Seth's Turn |
| Seth           | Seth, George, Anne, Noah | 8            | s     | George's Turn |
| Seth           | Seth, George, Anne, Noah | 6            | h     | George's Turn |
| Seth           | Seth, George, Anne, Noah | 6            | h     | George's Turn |
