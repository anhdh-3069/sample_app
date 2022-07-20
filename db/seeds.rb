User.create!(name: "Dương Hoàng Anh",
             email: "duong.hoang.anh@sun-asterisk.com",
             password: "123123",
             password_confirmation: "123123",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
name = "aa"
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
30.times do
    content = "abc"
    users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user = users.first
following = users[2..20]
followers = users[3..15]
following.each{|followed| user.follow(followed)}
followers.each{|follower| follower.follow(user)}
