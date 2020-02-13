class UsersController < ApplicationController

  post '/sessions' do

    redirect '/plants'
  end

  get '/signup' do
    if logged_in?
      redirect "/plants"
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if !params[:username].empty? && !params[:password].empty?
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect to "/plants"
    else
      #error? required fields
      redirect to "/signup"
    end
  end

  get '/login' do
    #error message?
    if logged_in?
      redirect '/plants'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if !params[:username].empty? && !params[:password].empty? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/plants"
    else
      redirect to "/signup"
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end

  get '/users/:id' do
    if logged_in?
      @user = current_user
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

  post '/logout' do
    redirect '/logout'
  end

end
