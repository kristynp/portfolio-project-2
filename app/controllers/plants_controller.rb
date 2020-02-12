class PlantsController < ApplicationController

  get '/plants' do
    erb :'/plants/index'
  end


end
