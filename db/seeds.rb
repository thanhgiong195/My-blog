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

10.times do |n|
  name = Faker::Name.name
  email = "bebe-#{n+1}@bebe.org"
  password = "123123"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
