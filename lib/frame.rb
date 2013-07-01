class Frame

  attr_accessor :bonus, :rolls	

  def initialize
    @bonus = 0	  
    @rolls = []
  end

  def strike?
    rolls.first == 10
  end

  def spare?
    total_pins == 10
  end

  def finished?
    strike? || rolls.length == 2
  end

  def roll pins
    rolls.push pins
    self
  end

  def total_pins
    rolls.inject { |sum,n| sum += n } 
  end

  def next_frame=(frame)
    @next_frame = frame
  end

  def next_frame
    @next_frame
  end

  def next_roll
    (has_next_frame?) ? 
      next_frame.rolls.first : nil
  end

  def next_two_rolls
    if( next_frame_finished? )
      if( next_frame.strike? )	
        10 + next_frame.next_roll rescue nil	      
      else
        next_frame.total_pins	      
      end
    else
      nil
    end
  end

  def has_next_frame?
    !next_frame.nil?
  end

  def next_frame_finished?
    has_next_frame? && next_frame.finished?
  end

  def score
    if strike?
      total_pins + next_two_rolls rescue nil
    elsif spare?
      total_pins + next_roll rescue nil
    else
      total_pins
    end
  end

end


