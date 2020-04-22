class TripsController < ApplicationController

  post "/trips/new" do
    @trip = Trip.create(params)
    redirect "/users/#{params[:user_id]}"
  end


  get "/trips/:id" do
    @trip = Trip.find(params[:id])
    @user = User.find(session[:id])
    erb :"trips/show"
  end



  get "trip/:id/edit" do
    @trip = Trip.find(params[:id])
    @user = User.find(session[:id])
    erb :"trips/edit"
  end
end
