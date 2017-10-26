  #--Render a register user page--#
get '/users/new' do
  @user = User.new
  if request.xhr?
    erb :"users/_new", layout: false
  else
    erb :"users/new"
  end
end

  #--Send info from registration to database--#
post '/users' do
  @user = User.new(params[:user])
  if request.xhr?
    if @user.save
      session[:user_id] = @user.id
      erb :"sessions/_logged_in_nav", layout: false
    else
      @errors = @user.errors.full_messages
      erb :"sessions/_logged_out_nav", layout: false
    end
  else
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      @errors = @user.errors.full_messages
      erb :"users/new"
    end
  end
end

  #--Display an individual user--#
get '/users/:id' do
  authenticate!
  @user = User.find_by(id: params[:id])
  authorize!(@user)
  erb :"users/show"
end
