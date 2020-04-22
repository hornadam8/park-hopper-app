class UsersController < ApplicationController

  get "/signup" do
    erb :"users/signup"
  end

  post "/users/signup" do
    @user = User.create(params[:user])
    redirect "/login"
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show"
  end
end
