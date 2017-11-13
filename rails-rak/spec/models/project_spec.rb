require 'rails_helper'

describe Project do

  let(:project) { Project.create!(project_name: "CA Fires",
                                  street_address: 300 Mission Street,
                                  city: "Napa",
                                  state: "California",
                                  zip_code: 94552,
                                  description: "Northern California Fires",
                                  organization_id: organization.id,
                                  event_id: event.id) }
  let(:)

  describe "associations" do

  end



  describe "validations" do
    it { should validate_presence_of(:project_name) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:zip_code) }
  end
end
