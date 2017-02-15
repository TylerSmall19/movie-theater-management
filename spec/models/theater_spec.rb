require 'rails_helper'

describe Theater do
  describe "Attributes" do
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :name }
  end
end
