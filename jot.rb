# Just a silly old test file. Can delete eventually.

require_relative 'config/environment'

photo = Unsplash::Photo.random(featured: true, orientation: "landscape")

# (url: photo.urls.regular, photog_name: "#{photo.user.first_name} #{photo.user.last_name}", photog_url: "#{photo.user.links.html}")
# p "#{photo.user.first_name} #{photo.user.last_name}"

# p "#{photo.user.links.html}"
