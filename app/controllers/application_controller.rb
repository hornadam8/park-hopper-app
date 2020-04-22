require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "AQOoE4ryloqtgkle5F35o3GOOA3A3qSoSeWaltOAogotRa;LyelGteoAlog24at4"
  end


  get '/' do
    if logged_in?
      redirect "/parks"
    else
      erb :"users/login"
    end
  end





  helpers do

    def logged_in?
      !!session[:id]
    end

  end
end
