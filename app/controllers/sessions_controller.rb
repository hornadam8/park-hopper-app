class SessionsController < ApplicationController

  get "/login" do
    erb :"users/login_signup"
  end


  post "/login" do
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  post "/logout" do
    session.clear
  end


end
