class UsersController < ApplicationController


  get "/users/:id/edit" do
    if logged_in? && current_user.id == params[:id]
      @park = Park.all[rand(61)]
      @user = User.find(session[:user_id])
      @rows = @user.trips.each_slice(4).to_a
      @i = 1
      erb :"users/edit"
    else
      erb :misadventure
    end
  end

  get "/users/:id" do
    if logged_in? && User.find_by(id: params[:id])
      @user = User.find(params[:id])
      @park = Park.all[rand(61)]
      @rows = @user.trips.each_slice(4).to_a
      @i = 1
      erb :"users/show"
    else
      erb :misadventure
    end
  end

  patch "/users/:id" do
    @user = User.find(session[:user_id])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
  end

  delete "/users/:id" do
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @user.destroy
      redirect "/login"
    else
      status 403
    end
  end


end
