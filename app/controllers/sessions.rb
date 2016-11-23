get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  if user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      @errors = ['Bad username/password combination']
      erb :'sessions/new'
    end
  else
    @errors = ['User not found']
    erb :'sessions/new'
  end
end

get '/sessions/logout' do
  require_login
  session.clear
  redirect '/'
end
