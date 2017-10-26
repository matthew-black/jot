  #--Display all of the things--#
get '/things' do
  erb :"/things/index"
end

  #--Render form for making a new thing--#
get '/things/new' do
  authenticate!
  erb :"/things/new"
end

  #--Create a new thing--#
post '/things' do
  @thing = Thing.new(params[:thing])
  authenticate!

  if @thing.valid?
    current_user.things << @things
    redirect "/things/#{@thing.id}"
  else
    @errors = @things.errors.full_messages
    erb :"/things/new"
  end
end

  #--Display an individual thing--#
get '/things/:id' do
  @thing = find_and_ensure(params[:id])
  erb :"/things/show"
end

  #--Render a form to edit a thing--#
get '/things/:id/edit' do
  @thing = find_and_ensure(params[:id])
  authenticate!
  authorize!(@thing.owner)
  erb :"/things/edit"
end

  #--Update a thing--#
put '/things/:id' do
  @thing = find_and_ensure(params[:id])
  authenticate!
  authorize!(@thing.owner)
  @thing.assign_attributes(params[:thing])

  if @thing.save
    redirect "/things/#{params[:id]}"
  else
    @errors = @thing.errors.full_messages
    erb :'things/edit'
  end
end

  #--Delete a thing--#
delete '/things/:id' do
  @thing = find_and_ensure(params[:id])
  authenticate!
  authorize!(@thing.owner)
  @thing.destroy
  redirect '/things'
end
