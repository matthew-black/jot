require_relative '../config/environment'
require 'faker'

# User.create!(full_name: "Avatar Aaang", username: "notthelastairbender", email: "aang@test.com", password: "password")
# User.create!(full_name: "Avatar Korra", username: "justrestoringbalance", email: "korra@test.com", password: "password")
# User.create!(full_name: "Roger Federer", username: "goat", email: "rf@test.com", password: "password")
# User.create!(full_name: "Steven Universe", username: "thatcookiecatlife", email: "steven@test.com", password: "password")
matt = User.create!(full_name: "Matthew Black", username: "matt", email: "matt@test.com", password: "password")


10.times do
  api_photo = Unsplash::Photo.random(featured: true, orientation: "landscape")
  photo = Photo.create!(url: api_photo.urls.regular, photog_name: "#{api_photo.user.first_name} #{api_photo.user.last_name}", photog_url: api_photo.user.links.html)
  jot_seed = Jot.create!(content: Faker::Lorem.sentence, public_post: true)
  photo.jot = jot_seed
  matt.jots << jot_seed
end