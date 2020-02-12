class PlantsController < Sinatra::Base

  get '/plants' do

    erb :'/plants/index'
  end

end
