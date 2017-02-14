require 'rails_helper'

describe Theater do
	context "When valid data is given" do
		it "persists to the data base" do
			t = Theater.create!(address: )
			expect(t.persisted?)
		end
	end
end