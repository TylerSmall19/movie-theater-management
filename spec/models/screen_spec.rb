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
end
