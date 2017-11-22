# Create an admin user
 admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create an premium
 premium = User.create!(
   email:    'premium@example.com',
   password: 'helloworld',
   role: 'premium'
 )
 
 # Create an standard user
 standard = User.create!(
   email:    'standard@example.com',
   password: 'helloworld',
   role: 'standard'
 )