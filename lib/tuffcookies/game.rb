module TuffCookie
  class Game
    attr_accessor :total_cards, :next_card_in_deck
    def initialize(output) 
      @outputz = output
      @outputz.puts "Welcome to Tuff Cookies!  What's your name?"
      @players = []
      @players << Player.new("George")
      @players << Player.new("Anne")
      @players << Player.new("Noah")
    end
    
    def start(start_card, player_name = nil) 
      player = Player.new(player_name)
      create_deck
      @current_card = start_card.to_i
      messages = ["What's up #{player_name}? You are playing against:", "The Card in Play is a #{@current_card}.", "Higher (h) or Lower (l)?"]
      messages.each do |message|
        @outputz.puts message
      end
    end
  

    def create_deck
      numbered_cards = []
      (1..15).each do |card| 
        numbered_cards.push(card, card, card, card) # 4 for copies of card to the deck.
      end
      @total_cards = numbered_cards.length
      @numbered_cards = numbered_cards
    end

    def current_card(current_card)
      @current_card = current_card.to_i
    end
    
    def dealer_flips_card(next_card_in_deck)
      @flipped_card = next_card_in_deck.to_i
    end
    
    def next_card_in_deck
      card = @numbered_cards.delete_at(rand(@numbered_cards.length))
    end
    
    def guess(guess)
      mark = Mark.new(guess, @current_card, @flipped_card)
      @outputz.puts mark.evaluate
      @outputz.puts "The flipped card is a #{@flipped_card}!"
      @current_card = @flipped_card
      @outputz.puts "The current card is now #{@current_card}... Higher(h) or Lower(l)?"
      dealer_flips_card(next_card_in_deck)
    end
  
  end  

  class Player
    def initialize(name)
      @score = 0
    end
  end
  
  class Mark
    def initialize(guess, current_card, flipped_card)
      @guess = guess
      @difference = flipped_card - current_card
    end
    def evaluate
      if @difference > 0 # flipped card is greater than current card
        answer = if @guess == 'h'
          "correct"  
        else
          "wrong"
        end   
      elsif @difference < 0 #flipped card is less than the current card
        answer = if @guess == 'h'
          "wrong"
        else
          "correct"
        end 
      elsif @difference == 0 # flipped card is the same as current card
        answer = "same"
      end
      return answer
    end
  end
end































