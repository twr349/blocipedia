require 'faker'

10.times do
    User.create!(
    email: Faker::Internet.email, 
    password: 'helloworld'
)
end

users = User.all



25.times do
    Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.word,
    body: Faker::Lorem.paragraph,
    private: false
)
end

10.times do 
    Wiki.create!(
    user: users.sample,
    title: "Shhh it's Private " + Faker::Lorem.word,
    body: Faker::Lorem.paragraph,
    private: true
)
end
wikis = Wiki.all


# Create an admin user
 admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'Admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 
 # Create an premium
 premium = User.create!(
   email:    'premium@example.com',
   password: 'helloworld',
   role: 'Premium'
 )
 premium.skip_confirmation!
 premium.save!
 
 # Create an standard user
 standard = User.create!(
   email:    'standard@example.com',
   password: 'helloworld',
   role: 'Standard'
 )
 standard.skip_confirmation!
 standard.save!
 
 puts "Seed finished"
 puts "#{User.count} users created!"
 puts "#{Wiki.count} wikis created!"
 puts admin
 puts premium
 puts standard
 