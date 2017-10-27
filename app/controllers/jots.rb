  #--Display all of the jots--#
get '/jots' do
  @jots = Jot.order(:created_at).reverse.select do |jot|
    jot.public_post
  end
  erb :"/jots/index"
end

  #--Show page for making a new jot--#
get '/jots/new' do
  authenticate!
  photo = Unsplash::Photo.random(featured: true, orientation: "landscape")
  @photo = Photo.new(url: photo.urls.regular, small_url: photo.urls.small, thumb_url: photo.urls.thumb, photog_name: "#{photo.user.first_name} #{photo.user.last_name}", photog_url: photo.user.links.html)
  if @photo.save
    erb :"/jots/new"
  else
    halt(404, erb(:'404'))
  end
end

  #--Create a new jot--#
post '/jots' do
  authenticate!
  @jot = Jot.new(content: params[:content], public_post: true)
  if @jot.save
    current_user.jots << @jot
    Photo.find(params[:photo]).jot = @jot
    # redirect "/"
    redirect "/jots/#{@jot.id}"
  else
    Photo.find(params[:photo]).destroy
    @errors = @jot.errors.full_messages
    redirect "/"
    # erb :"/jots/new"
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
