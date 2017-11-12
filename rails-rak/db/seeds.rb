Donor.destroy_all
Category.destroy_all
Organization.destroy_all
Event.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  Donor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip_code, password: "password")
end

categories = ['Health', 'Social', 'Environment', 'Education', 'Natural Distaster']

categories.each{ |category| Category.create(category_name: category) }


10.times do
  Organization.create(organization_name: Faker::Company.name, tax_code:Faker::Company.duns_number, email: Faker::Internet.email, url: Faker::Company.logo, mission_statement: Faker::Company.buzzword, password: 'password', category: Category.all.sample)
end

10.times { Event.create( event_name: Faker::Demographic.demonym) }

Organization.all.each do |organization|
  organization.projects << Project.new(project_name: Faker::Job.field, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip_code, description: Faker::Lorem.paragraph, organization: organization, event: Event.all.sample)
end