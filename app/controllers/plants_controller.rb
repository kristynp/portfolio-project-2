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

  post '/plants/new' do
    redirect '/plants/new'
  end

  post '/plants' do
    #binding.pry
    @user = current_user
    if !params[:name].empty? && !params[:sunlight].empty? && !params[:water].empty? && current_user != nil
      @plant = Plant.create(name: params[:name], sunlight: params[:sunlight], water: params[:water])
      @plant.user_id = @user.id
      @plant.save
      redirect '/plants'
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

  delete '/plants/:id' do
    @plant = Plant.find_by(id: params[:id])
    if current_user.id == @plant.user_id
      @plant.delete
    end
    redirect '/plants'
  end

  get '/plants/:id/edit' do
    if logged_in?
      @plant = Plant.find_by(id: params[:id])
      erb :'/plants/edit'
    else
      redirect '/plants'
    end
  end

  post '/plants/:id' do
    if logged_in?
      @plant = Plant.find_by(id: params[:id])
      redirect :"/plants/#{@plant.id}/edit"
    else
      #error, can't edit plant unless you are the owner
      redirect '/plants'
    end
  end

  patch '/plants/:id' do
    @plant = Plant.find_by(id: params[:id])
    if current_user.id == @plant.user_id

      if !params[:name].empty?
        @plant.name = params[:name]
        @plant.save
      end
      if !params[:sunlight].empty?
        @plant.sunlight = params[:sunlight]
        @plant.save
      end
      if !params[:water].empty?
        @plant.water = params[:water]
        @plant.save
      end
    end
    redirect "/plants/#{@plant.id}"
  end



end
