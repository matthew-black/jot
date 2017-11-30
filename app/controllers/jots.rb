  #--Display three random jots from the most recent 10--#
get "/jots" do
  @jots = Jot.order(:created_at).reverse.select do |jot|
    jot.public_post
  end.slice(0..9).shuffle.slice(0..2)
  erb :"/jots/index"
end

  #--Show page for making a new jot--#
get "/jots/new" do
  authenticate!
  photo = Unsplash::Photo.random(featured: true, orientation: "landscape")
  @photo = Photo.new(
    url: photo.urls.regular,
    photog_name: "#{photo.user.first_name} #{photo.user.last_name}",
    photog_url: photo.user.links.html
  )
  if @photo.valid?
    erb :"/jots/new"
  else
    halt(404, erb(:"404"))
  end
end

  #--Create a new jot--#
post "/jots" do
  authenticate!
  @photo = Photo.new(params[:photo])
  @jot = Jot.new(content: params[:content])
  if @jot.save
    current_user.jots << @jot
    @photo.save
    @photo.jot = @jot
    redirect "/jots/#{@jot.id}"
  else
    redirect "/"
  end
end

  #--Display an individual jot--#
get "/jots/:id" do
  @jot = find_and_ensure(params[:id])
  erb :"/jots/show"
end

  #--Toggle a jot's public/private status--#
put "/jots/:id" do
  authenticate!
  @jot = find_and_ensure(params[:id])
  authorize!(@jot.user)
  @jot.toggle_visibility
  redirect "jots/#{@jot.id}"
end
