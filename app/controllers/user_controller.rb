
get '/users/new' do

  erb :'users/new' #show new users view

end


post '/users' do
  @user = User.new(params[:user]) #create new user
  
  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users/#{@user.id}' #redirect back to users index page
  else
    erb :'users/new' # show new users view again(potentially displaying errors)
  end

end


get '/users/:id' do
  @user = User.find(params[:id]) 
	
	if logged_in?

  	erb :'users/show' 
  else

  	erb :'sessions/new'
  end
end

# get '/users/:id/edit' do

#   @user = User.find(params[:id])

#   erb :'users/edit'
# end

# put '/users/:id' do

#   @user = User.find(params[:id])

# if logged_in?
#   @user.assign_attributes(params[:user]) 

#   if @user.save 
#     redirect '/users' 
#   else
#     erb :'users/edit' #show edit user view again(potentially displaying errors)
#   end

# end

delete '/users/:id' do

	if logged_in?

  	@user = User.find(params[:id]) #define user to delete

  	@user.destroy #delete user

  	redirect '/' #redirect back to users index page
	else 
		redirect '/'
	end
end