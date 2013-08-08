get '/' do
  erb :index
end

get '/log_me_out' do
  session.clear
  redirect to '/'
end

get '/secret' do
  if session[:user_id] == nil
    redirect to '/'
  end
  
  erb :secret_page
end

post '/signup' do
  @new_user = User.create(params[:user])
  session[:user_id] = @new_user.id
  redirect to '/secret'
end

post '/login' do
  @user = params[:user]
  @current_user = User.find_by(user_name: @user[:user_name])

  if @current_user 
    false_or_object = @current_user.authenticate(@user[:password])

    if @current_user == false_or_object 
      session[:user_id] = @current_user.id
      puts "#{@current_user.user_name} logged in "
      redirect to '/secret'
    end
  end

  redirect to '/'
end


