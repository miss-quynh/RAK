require 'rails_helper'

describe Category do
  let(:category) { Category.new }

  describe "validations" do
    it "is valid when a category has a name" do
      category.category_name = "Healthcare"
      category.valid?
      expect(category.errors[:category]).to be_empty
    end
  end

end