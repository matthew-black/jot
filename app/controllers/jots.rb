  #--Display all of the jots--#
get '/jots' do
  @jots = Jot.order(:created_at).reverse.select do |jot|
    jot.public_post
  end.slice(0..4)
  # .slice(0..9).shuffle.slice(0..4)
      #--if you want five randoms from the  most recent 10 jots
  erb :"/jots/index"
end

  #--Show page for making a new jot--#
get '/jots/new' do
  authenticate!
  photo = Unsplash::Photo.random(featured: true, orientation: "landscape")
  @photo = Photo.new(url: photo.urls.regular, small_url: photo.urls.small, thumb_url: photo.urls.thumb, photog_name: "#{photo.user.first_name} #{photo.user.last_name}", photog_url: photo.user.links.html)
  if @photo.save
    @disappearable = true
    erb :"/jots/new", layout: false
  else
    halt(404, erb(:'404'))
  end
end

  #--Create a new jot--#
post '/jots' do
  authenticate!
  @jot = Jot.new(content: params[:content])
  if @jot.save
    current_user.jots << @jot
    Photo.find(params[:photo]).jot = @jot
    redirect "/jots/#{@jot.id}"
  else
    Photo.find(params[:photo]).destroy
    @errors = @jot.errors.full_messages
    erb :"/jots/new"
  end
end

  #--Display an individual jot--#
get '/jots/:id' do
  @jot = find_and_ensure(params[:id])
  erb :"/jots/show"
end

  #--Update a jot--#
    #--Just be able to toggle private/public--#
put '/jots/:id' do
  authenticate!
  @jot = find_and_ensure(params[:id])
  authorize!(@jot.user)
  @jot.toggle_visibility
  redirect "jots/#{@jot.id}"
end
