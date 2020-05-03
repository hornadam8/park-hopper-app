class TripsController < ApplicationController

  post "/trips/new" do
    @trip = Trip.create(params)
    redirect "/trips/#{@trip.id}"
  end


  get "/trips/:id" do
    if logged_in? && Trip.find_by(id: params[:id])
      @trip = Trip.find(params[:id])
      erb :"trips/show"
    else
      erb :misadventure
    end
  end



  get "/trips/:id/edit" do
    @trip = Trip.find(params[:id])
    if logged_in? && @trip.user_id == current_user.id
        @user = current_user
        erb :"trips/edit"
    else
      erb :misadventure
    end
  end

  patch "/trips/:id" do
    @trip = Trip.find(params[:id])
    new_info = params.reject!{|k| k == "_method"}
    @trip.update(new_info)
    redirect "/trips/#{@trip.id}"
  end

  delete "/trips/:id" do
    @trip = Trip.find(params[:id])
    if logged_in? && current_user.id == @trip.user_id
      @trip.destroy
      redirect "/users/#{current_user.id}"
    else
      redirect "/logout"
    end
  end

end
