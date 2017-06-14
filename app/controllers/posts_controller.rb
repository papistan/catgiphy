get '/posts' do

  @posts = Post.all 

  erb :'posts/index'

end


get '/posts/new' do

  erb :'posts/new'

end


post '/posts' do

  @post = Post.new(params[:post])

  if @post.save 
    redirect '/posts' 
  else
    erb :'posts/new' 
  end

end


get '/posts/:id' do

  @post = Post.find(params[:id])
  
  erb :'posts/show'

end

# get '/posts/:id/edit' do

#   #get params from url
#   @post = Post.find(params[:id]) #define intstance variable for view

#   erb :'posts/edit' #show edit post view

# end


# put '/posts/:id' do

#   #get params from url
#   @post = Post.find(params[:id]) #define variable to edit

#   @post.assign_attributes(params[:post]) #assign new attributes

#   if @post.save #saves new post or returns false if unsuccessful
#     redirect '/posts' #redirect back to posts index page
#   else
#     erb :'posts/edit' #show edit post view again(potentially displaying errors)
#   end

# end

delete '/posts/:id' do

  @post = Post.find(params[:id])

  @post.destroy

  redirect '/posts'

end



