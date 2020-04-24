class SessionsController < ApplicationController

  get "/login" do
    erb :"users/login"
  end


  post "/login" do
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/parks"
    else
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end


end
