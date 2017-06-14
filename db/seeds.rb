require 'faker'

if User.count < 10
    10.times do
      user = {}
      user[:username] = Faker::Internet.user_name(5..10)
      user[:email] = Faker::Internet.email
      user[:password_hash] = "password"
      User.create(user)
  end
end

if Post.count < 30
  30.times do
    post = {}
    post[:title] = Faker::ChuckNorris.fact
    post[:comment] = Faker::ChuckNorris.fact
    post[:user_id] = rand(1..10)
    Post.create(post)
  end 
end

if Comment.count < 50
  50.times do
    comment = {}
    comment[:title] = Faker::ChuckNorris.fact
    comment[:comment] = Faker::ChuckNorris.fact
    comment[:user_id] = rand(1..10)
    comment[:post_id] = rand(1..30)
    Comment.create(comment)
  end 
end
