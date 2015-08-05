require 'battleships'
require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  enable :sessions

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new-game' do
    @name = params[:name]
    erb :newgame
  end

  get '/start-game' do
    @visitor = params[:name]
    session["name"] = params[:name]
    erb :startgame
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
