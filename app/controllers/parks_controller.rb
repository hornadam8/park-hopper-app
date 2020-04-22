class ParksController < ApplicationController

  get "/parks" do
    @user = User.find(session[:id])
    @parks = Park.all
    erb :"parks/index"
  end


  get "/parks/:id" do
    @user = User.find(session[:id])
    @park = Park.find(params[:id])
    erb :"parks/show"
  end

end
