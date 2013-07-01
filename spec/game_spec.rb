require 'game'

describe Game, "Bowling"  do

  let(:bowling) { Game.new }	

  context "Gutter Game" do
    before :each do
      20.times { bowling.gutterball }
    end

    it "has 10 frames" do
      bowling.frames.length.should eq 10
    end

    it "has a score of 0" do
      bowling.score.should eq 0
    end
  end

  context "All Ones" do
    before :each do
      20.times { bowling.roll 1 }
    end

    it "has 10 frames" do
      bowling.frames.length.should eq 10
    end

    it "has a score of 20" do
      bowling.score.should eq 20
    end
  end

  context "Spare & 1 pin each one" do
    before :each do
      bowling.roll 9
      bowling.spare
      18.times { bowling.roll 1 }
    end

    it "has 10 frames" do
      bowling.frames.length.should eq 10
    end

    it "has score 29" do
      bowling.score.should eq 29
    end
  end

  context "Strike & 1 pin each one" do
    before :each do
      bowling.strike
      18.times { bowling.roll 1 }
    end

    it "has 10 frames" do
      bowling.frames.length.should eq 10
    end

    it "has score 30" do
      bowling.score.should eq 30
    end
  end

  context "Perfect Game" do
    before :each do
      12.times { bowling.strike }
    end

    it "has 12 frames" do
      bowling.frames.length.should eq 12
    end

    it "has score 300" do
      bowling.score.should eq 300
    end
  end

end


