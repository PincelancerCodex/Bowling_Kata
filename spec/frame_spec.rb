require 'frame'

describe Frame, "Bowling" do
 
  let(:frame) { Frame.new }

  context "initialize" do
    it "sets bonus as 0(default)" do
      frame.bonus.should eq 0
    end

    it "sets rolls as [](default)" do
      frame.rolls.should be_kind_of Array
    end
  end

  it "check if the roll is strike?" do
    frame.roll 10
    frame.strike?.should be_true
  end

  it "check if the roll is spare?" do
    frame.roll 5
    frame.roll 5
    frame.spare?.should be_true
  end

  it "has score 9 after rolls 4/5" do
    frame.roll 4
    frame.roll 5
    frame.score.should eq 9
  end

  it "has score 15 after rolls 5/5 & 5 as bonus" do
    frame.roll 5
    frame.roll 5
    frame.roll 5
    frame.score.should eq 15
  end

  it "should to finish after 2 rolls" do
    frame.roll 3
    frame.roll 5
    frame.finished?.should be_true
  end

  it "not should to finish after 1 roll" do
    frame.roll 6
    frame.finished?.should be_false
  end

  it "should to finish after strike" do
    frame.roll 10
    frame.finished?.should be_true
  end

  context "on a Spare..." do
    it "initially has no score" do
      frame.roll 3
      frame.roll 7
      frame.score.should be_nil
    end

    it "has score 17 after 4/6 & 7 as next frame" do
      frame.roll 4
      frame.roll 6
      frame.next_frame = Frame.new
      frame.next_frame.roll 7
      frame.score.should eq 17
    end
 
    it "has score 17 after 3/7 & 2-pin frame" do
      frame.roll 3
      frame.roll 7
      frame.next_frame = Frame.new
      frame.next_frame.roll 7
      frame.next_frame.roll 2
      frame.score.should eq 17
    end
  end

  context "on a Strike..." do
    it "initially has no score" do
      frame.roll 10
      frame.score.should be_nil
    end

    it "has score 18 after strike & 5/3" do
      frame.roll 10
      frame.next_frame = Frame.new
      frame.next_frame.roll 5
      frame.next_frame.roll 3
      frame.score.should eq 18
    end
  end
   
end


