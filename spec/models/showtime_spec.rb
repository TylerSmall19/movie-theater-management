require 'rails_helper'

describe Showtime do
  let(:showtime){ build(:showtime) }

  describe "Associations" do
    it "belongs to a movie" do
      expect(showtime.movie).to be_an_instance_of Movie
    end

    it "belongs to a screen" do
      expect(showtime.screen).to be_an_instance_of Screen
    end

    xit "has many tickets" do
      # TODO Implement Ticket models
      screen.tickets.each do |ticket|
        expect(ticket).to be_an_instance_of Ticket
      end
    end
  end

  describe "Attributes" do
    it "has a time" do
      expect(showtime.time).to be_an_instance_of Time
    end
  end
end
