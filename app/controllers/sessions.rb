  #--Render login page--#
get '/sessions/new' do
  if request.xhr?
    erb :"sessions/_new", layout: false
  else
    erb :"sessions/new"
  end
end

  #--Ask database if the user exists and provided a valid password--#
post '/sessions' do
  @user = User.find_by(email: params[:email])
  if request.xhr?
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :"sessions/_logged_in_nav", layout: false
    else
      @error = "incorrect email or password"
      erb :"sessions/_logged_out_nav", layout: false
    end
  else
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      @errors = ["incorrect email or password."]
      erb :"sessions/new"
    end
  end
end

  #--Upon user logout, delete the session and redirect to homepage--#
delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end

  #--Render unauthorized page--#
get '/not_authorized' do
  erb :not_authorized
end
