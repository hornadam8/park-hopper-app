class SessionsController < ApplicationController

  post "/sessions/login" do
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    @user = User.find_by(email: session[:email])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end

  end
