class UsersController < ApplicationController

  get "/users/signup" do
    erb :"users/signup"
  end

  post "/users/signup" do
    @user = User.new(params[:user])
    if @user.save && params[:user][:password].length >= 6
      session[:user_id] = @user.id
      redirect "/parks"
    else
      redirect "/users/signup"
    end
  end

  get "/users/:id/edit" do
    @user = User.find(session[:user_id])
    erb :"users/edit"
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show"
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
      redirect "/logout"
    end
  end

end
