module TuffCookie
  class Game
    def initialize(output_g)
      @outputz = output_g
    end
    
    def start(current_card_g)
      @current_card = current_card_g.to_i
      messages = ["Welcome to Tuff Cookies!", "err... I mean NGDubs!", "In any case, the Card in Play is a #{@current_card}.", "Higher (h) or Lower (l)?"]
      messages.each do |message|
        @outputz.puts message
      end
    end
    
    def flipped_card(flipped_card_g)
      @flipped_card = flipped_card_g.to_i
    end
    
    def guess(guess_g)
      guess = guess_g
      @outputz.puts "The flipped card is a #{@flipped_card}!"
      if @flipped_card > @current_card
        if guess == 'h'
          @outputz.puts "correct"  
        elsif guess == 'l'
          @outputz.puts "wrong"
        end   
      elsif @flipped_card < @current_card 
        if guess == 'h'
          @outputz.puts "wrong"
        elsif guess == 'l'
          @outputz.puts "correct"
        end 
      elsif @flipped_card == @current_card 
        @outputz.puts "same"
      end
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