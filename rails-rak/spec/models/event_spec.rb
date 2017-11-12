require 'rails_helper'

describe Event do
  let(:event) { Event.new }

  describe "validations" do
    it "is valid when an event has a name" do
      event.event_name = "Northern California Fires"
      event.valid?
      expect(event.errors[:event]).to be_empty
    end
  end

end
