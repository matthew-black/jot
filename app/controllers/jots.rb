  #--Display all of the jots--#
get '/jots' do
  # photo = Unsplash::Photo.random(featured: true, orientation: "landscape")
  # @photo = Photo.new(url: photo.urls.regular, thumb_url: photo.urls.thumb, photog_name: "#{photo.user.first_name} #{photo.user.last_name}", photog_url: photo.user.links.html)
  erb :"/jots/new"
end

  #--Show page for making a new jot--#
get '/jots/new' do
  authenticate!
  erb :"/jots/new"
end

  #--Create a new jot--#
post '/jots' do
  authenticate!
  @jot = Jot.new(params[:jot])
  if @jot.valid?
    current_user.jots << @jots
    redirect "/jots/#{@jot.id}"
  else
    @errors = @jots.errors.full_messages
    erb :"/jots/new"
  end
end

  #--Display an individual jot--#
get '/jots/:id' do
  @jot = find_and_ensure(params[:id])
  erb :"/jots/show"
end

  #--Render a form to edit a jot--#
# get '/jots/:id/edit' do
#   @jot = find_and_ensure(params[:id])
#   authenticate!
#   authorize!(@jot.writer)
#   erb :"/jots/edit"
# end

  #--Update a jot--#
# put '/jots/:id' do
#   authenticate!
#   @jot = find_and_ensure(params[:id])
#   authorize!(@jot.owner)
#   @jot.assign_attributes(params[:jot])

#   if @jot.save
#     redirect "/jots/#{params[:id]}"
#   else
#     @errors = @jot.errors.full_messages
#     erb :'jots/edit'
#   end
# end

#   #--Delete a jot--#
# delete '/jots/:id' do
#   @jot = find_and_ensure(params[:id])
#   authenticate!
#   authorize!(@jot.owner)
#   @jot.destroy
#   redirect '/jots'
# end
