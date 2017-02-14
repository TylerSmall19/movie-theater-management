require 'rails_helper'

describe Screen do
  let(:s){ build(:screen) }

  describe "Associations" do
    it "belongs to a movie" do
      s.movie = build(:movie)
      expect(s.movie).to be_an_instance_of Movie
    end

    it "belongs to a theater" do
      expect(s.theater).to be_an_instance_of Theater
    end
  end

  describe "Attributes" do
    it "has an optional description" do
      expect(s.description).to be nil
      s.description = "Desc"
      expect(s.description).to eq "Desc"
    end

    it "has a number" do
      expect(s.number).to be 100
    end

    it "has a capacity" do
      expect(s.capacity).to be 125
    end
  end
end
