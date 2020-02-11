class UsersController < ApplicationController

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

end
