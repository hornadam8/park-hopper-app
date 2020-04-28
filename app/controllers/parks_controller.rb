class ParksController < ApplicationController

  get "/parks" do
    @user = User.find(session[:user_id])
    @parks = Park.all
    @rows = @parks.each_slice(4).to_a
    @i = 1
    erb :"parks/index"
  end


  get "/parks/:id" do
    if Park.find_by(id: params[:id])
      @user = User.find(session[:user_id])
      @park = Park.find(params[:id])
      erb :"parks/show"
    else
      status 404
    end
  end

end
