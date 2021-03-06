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
    if !params[:color].empty? && !params[:size].empty? && current_user != nil
      @plant_pot = PlantPot.create(color: params[:color], size: params[:size])
      @plant_pot.plant_id = params[:plant_id]
      @plant_pot.save
      redirect '/plant_pots'
    else
      redirect '/plant_pots/new'
    end
  end

  get '/plant_pots/:id' do
    if logged_in?
      @plant_pot = PlantPot.find_by(id: params[:id])
      erb :'/plant_pots/show'
    else
      redirect '/login'
    end
  end

  get '/plant_pots/:id/edit' do
    if logged_in?
      @plant_pot = PlantPot.find_by(id: params[:id])
      erb :'/plant_pots/edit'
    else
      redirect '/plants'
    end
  end

  patch '/plant_pots/:id' do
    @plant_pot = PlantPot.find_by(id: params[:id])
    if current_user.id == @plant_pot.plant.user_id
      if !params[:color].empty?
        @plant_pot.color = params[:color]
        @plant_pot.save
      end
      if !params[:size].empty?
        @plant_pot.size = params[:size]
        @plant_pot.save
      end
      if !params[:plant_id].empty?
        @plant_pot.plant_id = params[:plant_id]
        @plant_pot.save
      end
    end
    redirect "/plant_pots/#{@plant_pot.id}"
  end

  get '/plant_pots/:id/delete' do
    @plant_pot = PlantPot.find_by(id: params[:id])
    if current_user.id == @plant_pot.plant.user_id
      @plant_pot.delete
    end
    redirect '/plant_pots'
  end

end
