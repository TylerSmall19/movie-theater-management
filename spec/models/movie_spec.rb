require 'rails_helper'

describe Movie do

  let(:title){ Faker::Book.title }
  let(:description){ Faker::Lorem.paragraph(4) }
  let(:movie){ build(:movie, title: title, description: description) }

  describe "Attributes" do
    it "has a readable title" do
      expect(movie.title).to eq title
    end

    it "has a readable description" do
      expect(movie.description).to eq description
    end
  end
end
