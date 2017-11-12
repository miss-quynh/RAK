require 'rails_helper'

describe Project do
  let(:project) { Project.new }

  describe "validations" do
    it "is valid when an project has a name" do
      project.project_name = "NorCal Fires"
      project.valid?
      expect(project.errors[:project]).to be_empty
    end

    it "is valid when an project has a zipcode" do
      project.zip_code = "14569"
      project.valid?
      expect(project.errors[:project]).to be_empty
    end
  end
end
