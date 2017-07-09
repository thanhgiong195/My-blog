User.create! name: "Be Thanh Giong",
  email: "dkcbvn1995@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  address: "Ha Noi",
  phone: "0999999999",
  is_admin: true

User.create! name: "Deumi",
  email: "dkcbvn@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  address: "Ha Noi",
  phone: "0999999999",
  is_admin: true

30.times do |n|
  name = Faker::Name.name
  email = "bebe-#{n+1}@bebe.org"
  password = "123123"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

users = User.order(:created_at).take Settings.seed.take_user
20.times do
  title = Faker::Lorem.sentence Settings.seed.title_post
  description = Faker::Lorem.sentence Settings.seed.des_post
  content = Faker::Lorem.sentence Settings.seed.content_post
  users.each{|user| user.posts.create! title: title, description: description, content: content}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
