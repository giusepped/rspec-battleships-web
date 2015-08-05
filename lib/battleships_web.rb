require 'battleships'
require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  enable :session

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new-game' do
    erb :newgame
  end

  get '/start-game' do
    if params[:name].empty?
      redirect '/new-game'
    else
      @player_1 = Player.new
      @player_1.name = params[:name]
      @player_2 = Player.new
      @player_2.name = 'COMPUTER'
      erb :startgame
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
