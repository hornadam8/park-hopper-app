class UsersController < ApplicationController

  get "/signup" do
    erb :"users/signup"
  end

  post "/signup" do
    @user = User.create(params[:user])
    redirect "/users/#{@user.id}"
  end

  get "/users/:id" do
    "#{session[:id]}#{session[:email]}"
  end
end
