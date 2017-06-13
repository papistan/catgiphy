get '/sessions' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    login(@user)
    erb :'index'
  else
    erb :'/sessions/new'
  end
end

get '/logout' do
  session[:id] = nil
  redirect '/sessions'
end

