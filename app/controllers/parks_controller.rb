class ParksController < ApplicationController

  get "/park/:id" do
    @park = Park.find(params[:id])
    erb :"parks/show"
  end

end
