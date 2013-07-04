get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

post '/' do
  @posts = Post.all

  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  @user = User.verify(params)
  unless @user.nil?
    session[:auth] = @user.id
    redirect "/user/#{@user.id}"
  else
    redirect '/'
  end
  erb :login
end

get '/signup' do 

  erb :signup
end

post '/create_user' do
  User.create(params[:user])
  redirect '/'
end

get '/user/:id' do
  redirect '/' unless session[:auth]
  @user = User.find(session[:auth])

  erb :user
end

get '/submit' do

  erb :submit
end