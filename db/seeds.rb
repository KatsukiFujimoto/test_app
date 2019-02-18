user_first = User.new(username: "chandler",
                          email: "chanchan@gmail.com",
                          password: "chanchan",
                          password_confirmation: "chanchan")
user_first.skip_confirmation!
user_first.save!

50.times do |n|
  num = n + 1
  user = User.new(
    username: "user#{num}",
    email: "user#{num}@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
  user.skip_confirmation!
  user.save!
end

51.times do |n|
  num = n + 1
  user = User.find(num)
  user.posts.create(
    content: Faker::Lorem.paragraph_by_chars(140, false)
  )
end