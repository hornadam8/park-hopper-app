class SessionsController < ApplicationController

  get "/login" do
    erb :"users/login"
  end

  get "/signup" do
    erb :"users/signup"
  end

  post "/signup" do
    @user = User.new(params[:user])
    if @user.save && params[:user][:password].length >= 6
      session[:user_id] = @user.id
      redirect "/parks"
    else
      erb :misadventure
    end
  end


  post "/login" do
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/parks"
    else
      erb :misadventure
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end


end
