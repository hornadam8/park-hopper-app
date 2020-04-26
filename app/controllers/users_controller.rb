class UsersController < ApplicationController




  get "/users/:id/edit" do
    @park = Park.all[rand(61)]
    @user = User.find(session[:user_id])
    @chunks = @user.trips.each_slice(4).to_a
    @i = 1
    erb :"users/edit"
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    @park = Park.all[rand(61)]
    @chunks = @user.trips.each_slice(4).to_a
    @i = 1
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
