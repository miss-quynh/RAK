class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :event
  has_one :category, through: :organization
  has_many :donations
  has_many :items, through: :donations
  has_many :donation_types, through: :items

  validates :project_name, :description, :zip_code, presence: true

end