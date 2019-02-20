# User data
user_first = User.new(username: "chandler",
                          email: "chanchan@gmail.com",
                          password: "chanchan",
                          password_confirmation: "chanchan")
user_first.skip_confirmation!
user_first.save!

# Users data
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

# Posts data
51.times do |n|
  num = n + 1
  user = User.find(num)
  user.posts.create(
    content: Faker::Lorem.paragraph_by_chars(140, false)
  )
end

# Comments data
10.times do |n|
  num = n + 1
  user = User.find(num)
  51.times do
    user.comments.create(
      content: Faker::Lorem.paragraph_by_chars(140, false),
      commentable_id: rand(51),
      commentable_type: 'Post'
    )
  end
end