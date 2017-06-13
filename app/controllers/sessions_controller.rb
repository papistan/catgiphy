get '/sessions' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    session[:id] = @user.id
    erb :'index'
  else
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/sessions'
end

