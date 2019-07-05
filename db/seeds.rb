


1.times do |n|
  first_name = FFaker::Food.fruit
  last_name = FFaker::Food.fruit
  birth = FFaker::Time.between 1.months.ago, 1.days.ago
  sex = rand(0..1)
  introduction = FFaker::Lorem.sentence 30
  role = rand(0..1)
  city=FFaker::Food.fruit
  country=FFaker::Food.fruit

  User.create! first_name: 'Toan',
    last_name: 'Nguyen',
    email: "toan@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Tung',
    last_name: 'Nguyen',
    email: "tung@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Minh',
    last_name: 'Hang',
    email: "minh@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Huy',
    last_name: 'Hieu',
    email: "hieu@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Hanh',
    last_name: 'Nguyen',
    email: "nguyen@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Yen',
    last_name: 'Thu',
    email: "thu@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Linh',
    last_name: 'Chi',
    email: "linh@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Yen',
    last_name: 'Minh',
    email: "yen@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Lan',
    last_name: 'Anh',
    email: "anh@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Hong',
    last_name: 'Diep',
    email: "diep@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Phuong',
    last_name: 'Anh',
    email: "anh1@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Lan',
    last_name: 'Hoa',
    email: "hoa@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Khanh',
    last_name: 'Phuong',
    email: "phuong@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Minh',
    last_name: 'Khang',
    email: "khang@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
  User.create! first_name: 'Hoang',
    last_name: 'Ha',
    email: "ha@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    birth: birth,
    sex: sex,
    introduction: introduction,
    role: role,
    city: 'Ha Noi',
    country: 'Viet Nam'
end

# 5.times do |n|
#   first_name = FFaker::Food.fruit
#   last_name = FFaker::Food.fruit
#   # email = Faker::Name.first_name+"@gmail.com"
#   birth = FFaker::Time.between 1.months.ago, 1.days.ago
#   sex = rand(0..1)
#   introduction = FFaker::Lorem.sentence 30
#   role = rand(0..1)
#   city=FFaker::Food.fruit
#   country=FFaker::Food.fruit
#
#   User.create! first_name: first_name,
#     last_name: "Nguyen",
#     email:  "#{first_name}@gmail.net",
#     password: "123456",
#     password_confirmation: "123456",
#     birth: birth,
#     sex: sex,
#     introduction: introduction,
#     role: role,
#     city: 'Ha Noi',
#     country: 'Viet Nam'
# end


# 10.times do |n|
#   context = FFaker::Lorem.sentence 30
#   commentable_id = rand(3..4)
#   user_id = rand(1..10)
#   Comment.create! user_id: user_id,
#   commentable_type: "Post",
#   commentable_id: commentable_id,
#   content: context
# end

# 1.times do |n|
#   context = FFaker::Lorem.sentence 30
#   like_count = rand(0..5)
#   comments_count= rand(0..3)
#   Post.create! context: context,
#   like_count: like_count,
#   comments_count: comments_count,
#   block: false,
#   user_id:1
# end

# 20.times do |n|
#   content = FFaker::Lorem.sentence 30
#   commentable_id = rand(1..3)
#
#   Comment.create! user_id:1,
#   commentable_type: "Post",
#   commentable_id: 32,
#   content: content
#
# end
# 1.times do |n|
#   first_name = FFaker::Food.fruit
#   last_name = FFaker::Food.fruit
#   birth = FFaker::Time.between 1.months.ago, 1.days.ago
#   sex = rand(0..1)
#   introduction = FFaker::Lorem.sentence 30
#   role = rand(0..1)
#   city=FFaker::Food.fruit
#   country=FFaker::Food.fruit

#   User.create! first_name: first_name,
#     last_name: last_name,
#     email: "admin123@gmail.com",
#     password: "111111",
#     password_confirmation: "111111",
#     birth: birth,
#     sex: sex,
#     introduction: introduction,
#     role: role,
#     city: city,
#     country: country
# end
