class PlantPotsController < ApplicationController
  get '/plant_pots' do
    erb :'/plant_pots/index'
  end

  get '/plant_pots/new' do
    if logged_in?
      erb :'/plant_pots/new'
    else
      redirect '/login'
    end
  end

  post '/plant_pots/new' do
    redirect '/plant_pots/new'
  end

  post '/plant_pots' do
    @
  end

end
