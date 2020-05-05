class ParksController < ApplicationController

  get "/parks" do
    if logged_in?
      set_parks
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
    if valid_search?
      set_parks
      redirect "/parks/#{@parks.id}"
    else
      erb :misadventure
    end
  end

  private

    def valid_search?
      Park.search(params[:search])
    end

    def set_parks
      @parks = Park.search(params[:search])
    end

end
