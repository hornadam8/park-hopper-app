class ParksController < ApplicationController

  get "/parks" do
    if logged_in?
      @user = current_user
      @parks = Park.search(params[:search])
      @rows = @parks.each_slice(4).to_a
      @i = 1
      erb :"parks/index"
    else
      erb :misadventure
    end
  end


  get "/parks/:id" do
    if logged_in? && Park.find_by(id: params[:id])
      @user = User.find(session[:user_id])
      @park = Park.find(params[:id])
      erb :"parks/show"
    else
      erb :misadventure
    end
  end

  post "/parks/search" do
    if Park.search(params[:search])
      @park = Park.search(params[:search])
      redirect "/parks/#{@park.id}"
    else
      erb :misadventure
    end
  end

end
