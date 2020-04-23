class ParksController < ApplicationController

  get "/parks" do
    @user = User.find(session[:user_id])
    @parks = Park.all
    erb :"parks/index"
  end


  get "/parks/:id" do
    @user = User.find(session[:user_id])
    @park = Park.find(params[:id])
    erb :"parks/show"
  end

end
