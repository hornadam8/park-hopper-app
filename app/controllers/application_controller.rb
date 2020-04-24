require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
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
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

  end
end
