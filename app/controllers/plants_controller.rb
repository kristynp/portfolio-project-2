class PlantsController < ApplicationController

  get '/plants' do
    erb :'/plants/index'
  end

  get '/plants/new' do
    if logged_in?
      erb :'/plants/new'
    else
      redirect '/login'
    end
  end

  post '/plants' do
    @user = current_user
    
  end

end
