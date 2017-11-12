require 'rails_helper'

describe Item do
  let(:item) { Item.new }

  describe "validations" do
    it "is valid when an item has a name" do
      item.item_name = "water bottles"
      item.valid?
      expect(item.errors[:item]).to be_empty
    end

    it "is valid when has a donation type" do
      item.donation_type = "Aquafina"
      item.valid?
      expect(item.errors[:item]).to be_empty
    end
  end

end
