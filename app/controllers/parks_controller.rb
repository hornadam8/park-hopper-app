class ParksController < ApplicationController

  get "/parks" do
    @user = User.find(session[:user_id])
    @parks = Park.all
    @chunks = @parks.each_slice(4).to_a
    @i = 1
    erb :"parks/index"
  end


  get "/parks/:id" do
    @user = User.find(session[:user_id])
    @park = Park.find(params[:id])
    erb :"parks/show"
  end

end
