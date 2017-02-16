describe Order do
  describe "Attributes" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :credit_card }
    it { is_expected.to validate_presence_of :expiration }
    it { is_expected.to validate_presence_of :showtime }
  end

  describe "Associations" do
    it { is_expected.to belong_to :showtime }
  end
end
