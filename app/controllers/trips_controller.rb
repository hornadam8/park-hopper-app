class TripsController < ApplicationController


  post "/trips/new" do
    trip = current_user.trips.create(params)
    redirect "/trips/#{trip.id}"
  end

  get "/trips/:id" do
    if logged_in? && set_trip
      erb :"trips/show"
    else
      erb :misadventure
    end
  end

  get "/trips/:id/edit" do
    set_trip
    if logged_in? && auth_user?
        @user = current_user
        erb :"trips/edit"
    else
      erb :misadventure
    end
  end

  patch "/trips/:id" do
    set_trip
    new_info = params.reject!{|k| k == "_method"}
    @trip.update(new_info)
    redirect "/trips/#{@trip.id}"
  end

  delete "/trips/:id" do
    set_trip
    if logged_in? && auth_user?
      @trip.destroy
      redirect "/users/#{current_user.id}"
    else
      redirect "/logout"
    end
  end

private

  def set_trip
    @trip = Trip.find_by(id: params[:id])
  end

  def auth_user?
    current_user.id == @trip.user_id
  end

end
