get '/' do
  redirect "/jots"
end

get '/about' do
  erb :about
end
