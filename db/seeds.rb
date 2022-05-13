User.create!(name: "Duong Hoang Anh",
             email: "duong.hoang.anh@sun-asterisk.com",
             password: "123123",
             password_confirmation: "123123",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
  # Generate a bunch of additional users.

  99.times do |n|
  name = n
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
