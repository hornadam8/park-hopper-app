class UsersController < ApplicationController


  get "/users/:id/edit" do
    set_user
    if logged_in? && auth_user?
      @park = Park.all[rand(61)]
      @user = current_user
      @rows = @user.trips.each_slice(4).to_a
      @i = 1
      erb :"users/edit"
    else
      erb :misadventure
    end
  end

  get "/users/:id" do
    if logged_in? && set_user
      @park = Park.all[rand(61)]
      @rows = @user.trips.each_slice(4).to_a
      @i = 1
      erb :"users/show"
    else
      erb :misadventure
    end
  end

  patch "/users/:id" do
    set_user
    if auth_user?
      @user.update(params[:user])
      redirect "/users/#{@user.id}"
    else
      erb :misadventure
    end
  end

  delete "/users/:id" do
    set_user
    if auth_user?
      @user.destroy
      redirect "/login"
    else
      status 403
    end
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def auth_user?
      current_user.id == @user.id
    end





end
