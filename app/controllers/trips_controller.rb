class TripsController < ApplicationController

  post "/trips/new" do
    @trip = Trip.create(params)
    redirect "/users/#{@trip.user_id}"
  end


  get "/trips/:id" do
    @trip = Trip.find(params[:id])
    @user = User.find(session[:user_id])
    erb :"trips/show"
  end



  get "/trips/:id/edit" do
    @trip = Trip.find(params[:id])
    @user = User.find(session[:user_id])
    erb :"trips/edit"
  end

  patch "/trips/:id" do
    @trip = Trip.find(params[:id])
    new_info = params.reject!{|k| k == "_method"}
    @trip.update(new_info)
    redirect "/trips/#{@trip.id}"
  end

  delete "/trips/:id" do
    @trip = Trip.find(params[:id])
    if current_user.id == session[:user_id]
      @trip.destroy
    else
      redirect "/logout"
    end
  end
end
