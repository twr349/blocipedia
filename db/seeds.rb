# Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a standard
 standard = User.create!(
   name:     'Standard User',
   email:    'standard@example.com',
   password: 'helloworld'
 )