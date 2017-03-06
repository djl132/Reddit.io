require 'random_data'



#SEED POSTS AND COMMENTS RESOURCE
50.times do
  Post.create!(
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

puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"



 #SEED ADS RESOURCE
 50.times do
   Ad.create!(
   title: RandomData.random_sentence,
   body: RandomData.random_paragraph,
   price: rand(1000)
   )
 end

 ads = Ad.all

 puts "Seed finished"
puts "#{Ad.count} ads were created"
