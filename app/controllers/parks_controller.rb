class ParksController < ApplicationController

  get "/parks" do
    @parks = Park.search(params[:search])
    @user = User.find(session[:user_id])
    @rows = @parks.each_slice(4).to_a
    @i = 1
    erb :"parks/index"
  end


  get "/parks/:id" do
    if Park.find_by(id: params[:id])
      @user = User.find(session[:user_id])
      @park = Park.find(params[:id])
      erb :"parks/show"
    else
      status 404
    end
  end

  private
    def parks_params
      params.require(:parks).permit(:name, :name, :search)
    end

end
