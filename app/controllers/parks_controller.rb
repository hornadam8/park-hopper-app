class ParksController < ApplicationController

  get "/parks" do
    @parks = Park.all
    erb :"parks/index"
  end


  get "/parks/:id" do
    @park = Park.find(params[:id])
    erb :"parks/show"
  end

end
