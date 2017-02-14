require 'rails_helper'

describe Screen do
  let(:screen){ build(:screen) }

  describe "Associations" do
    it "belongs to a movie" do
      screen.movie = build(:movie)
      expect(screen.movie).to be_an_instance_of Movie
    end

    it "belongs to a theater" do
      expect(screen.theater).to be_an_instance_of Theater
    end
  end

  describe "Attributes" do
    it "has an optional description" do
      expect(screen.description).to be nil
      screen.description = "Desc"
      expect(screen.description).to eq "Desc"
    end

    it "has a number" do
      expect(screen.number).to be 100
    end

    it "has a capacity" do
      expect(screen.capacity).to be 125
    end
  end
end
