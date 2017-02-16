require 'rails_helper'

describe Showtime do
  describe "Associations" do
    it { is_expected.to belong_to :screen }
    it { is_expected.to belong_to :movie }

    it { is_expected.to have_many :tickets }
    it { is_expected.to have_many :orders }
  end

  describe "Attributes" do
    it { is_expected.to validate_presence_of :time }
    it { is_expected.to validate_presence_of :movie }
    it { is_expected.to validate_presence_of :screen }
  end
end
