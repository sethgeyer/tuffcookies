module TuffCookie
  class Game
    def initialize(output_g)
      @outputz = output_g
      Deck.new
    end
      
    def start(start_card_g)
      @current_card = start_card_g.to_i
      messages = ["Welcome to Tuff Cookies!", "err... I mean NGDubs!", "In any case, the Card in Play is a #{@current_card}.", "Higher (h) or Lower (l)?"]
      messages.each do |message|
        @outputz.puts message
      end
    end
    
    def flipped_card(flipped_card_g)
      @flipped_card = flipped_card_g.to_i
    end
    
    def current_card(current_card)
      @current_card 
    end
    
    def guess(guess_g)
      guess = guess_g
      mark = Mark.new(guess_g, @current_card, @flipped_card)
      @outputz.puts mark.evaluate
      @outputz.puts "The flipped card is a #{@flipped_card}!"
      @current_card = @flipped_card
      @outputz.puts "The current card is now #{@current_card}... Higher(h) or Lower(l)?"
      flipped_card(rand(1..15))
    end
  
    def tally(tally)
    end
  
  
  end

  class Mark
    def initialize(guess, current_card, flipped_card)
      @guess = guess
      @flipped_card = flipped_card
      @current_card = current_card
    end
    def evaluate
      if @flipped_card > @current_card
        if @guess == 'h'
          answer = "correct"  
        elsif @guess == 'l'
          answer = "wrong"
        end   
      elsif @flipped_card < @current_card 
        if @guess == 'h'
          answer = "wrong"
        elsif @guess == 'l'
          answer = "correct"
        end 
      elsif @flipped_card == @current_card 
        answer = "same"
      end
      return answer
    end
  
  
  end



  class Deck
    def initialize
      numbered_cards = []
      (1..15).each do |card| 
        numbered_cards.push(card, card, card, card) # Add for copies of card to the deck.
      end
      @numbered_cards = numbered_cards
    end
    
    
  end

end





































=begin

module TuffCookie
  class Game
    def initialize(output)
    @output = output
    end
  
    def start(current_card)
     @output.puts "Welcome to Tuff Cookies!"
     @output.puts "err... I mean NGDubs!"
     @output.puts "In any case, the Card in Play is a #{current_card}."
     @output.puts "Higher (h) or Lower (l)?"
    end
    
    def guess(guess)
    
    @guess = guess
    end
  
    def next_card(next_card)
      @next_card = next_card
    end
    
    def answer(answer)
      if @guess == "h" && @next_card == "8"
        @output.puts "correct"
      else
        @output.puts "incorrect"
      end
    end
    
  end
end

=end