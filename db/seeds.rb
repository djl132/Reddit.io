require 'random_data'



5.times do
  User.create!(
# #3
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
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
  Post.create!(
  topic: topics.sample,
  user: users.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end



 user = User.first
 user.update_attributes!(
   email: 'djl132@case.edu', # replace this with your personal email
   password: 'helloworld'
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
