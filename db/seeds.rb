# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

user = User.create email: 'sam@sam.com', password: 123_321_123, password_confirmation: 123_321_123
user2 = User.create email: 'admin@admin.admin', password: 123_321_123, password_confirmation: 123_321_123

{
  'Title' => 'This is the body of the posts',
  'Another Post' => 'This post is about a post that post a post that did post',
  'Some other Post' => 'Its Another post'
}.each do |title, body|
  Post.create(title:, body:, user:)
end
