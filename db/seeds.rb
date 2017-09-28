require 'random_data'



5.times do
  User.create!(
  name:RandomData.random_name,
  email:RandomData.random_email,
  password: RandomData.random_sentence )
end


 user = User.first
 user.update_attributes!(
   name:     'Member User',
   email: 'linderek618@gmail.com', # replace this with your personal email
   password: 'helloworld'
 )

 # Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'djl132@case.edu',
  password: 'helloworld',
  role:     'admin'
)


users = User.all

# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all


#SEED POSTS AND COMMENTS RESOURCE
50.times do
  post = Post.create!(
  topic: topics.sample,
  user: users.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )

# radomize create times
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  # randomize votes by random users
  rand(1..5).times{post.votes.create!(value: [1,-1].sample, user: users.sample) }

end

posts = Post.all

100.times do
  Comment.create!(
  user: users.sample,
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Vote.count} votes created"
