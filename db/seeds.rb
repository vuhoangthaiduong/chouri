# Create a admin user.
User.create!(username: "Vu Hoang Thai Duong", 
            email: "admin@admin.com",
            password: "abcdef", 
            password_confirmation: "abcdef",
            is_admin: true)

#Generate other users
30.times do |n|
  username = Faker::Internet.username
  email = Faker::Internet.free_email(name: username)
  password = "abcdef"
  phone_number = Faker::PhoneNumber.cell_phone
  User.create!(username: username,
              email: email,
              password: password,
              password_confirmation: password)
end
