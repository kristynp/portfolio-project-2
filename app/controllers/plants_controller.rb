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
    if !params[:name].empty? && !params[:sunlight].empty? && !params[:water].empty? && current_user != nil
      @plant = Plant.create(name: params[:name], sunlight: params[:sunlight], water: params[:water])
      @plant.user_id = @user.id
      @plant.save
    else
      redirect '/plants/new'
    end
  end

  get '/plants/:id' do
    if logged_in?
      @plant = Plant.find_by(id: params[:id])
      erb :'/plants/show'
    else
      redirect '/login'
    end
  end

end
