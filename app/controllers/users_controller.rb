class UsersController < ApplicationController

  post '/sessions' do

    redirect '/plants'
  end

  get "/logout" do
    session.clear
    redirect "/login"
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
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to "/plants"
    else
      #error? required fields
      redirect to "/signup"
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    binding.pry
    if !params[:username].empty? && !params[:password].empty? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/plants"
    else
      redirect to "/login"
    end
  end



end
