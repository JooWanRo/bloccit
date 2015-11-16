require 'faker'

init_post_size = Post.count
init_comment_size = Comment.count

=begin
# Create Posts
50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
=end

# Create a unique Post
# title: Unique Title
# body:  HELLO!
if ((Post.find_by title: 'Unique Title', body: 'HELLO!') == nil) then
  Post.create!(
    title: 'Unique Title',
    body:  'HELLO!'
  )
end

# This post had id: 51
post = Post.find_by title: 'Unique Title', body: 'HELLO!'

# Create a unique Comment
# post_id: 51
# body:    COMMENT!
if ((Comment.find_by post: post, body: 'COMMENT!') == nil) then
  Comment.create!(
    post: post,
    body: 'COMMENT!'
  )
end

puts "Seed finished"
puts "#{Post.count - init_post_size} posts created"
puts "#{Comment.count - init_comment_size} comments created"
