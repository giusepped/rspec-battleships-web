require 'battleships'
require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new-game' do
    erb :newgame
  end

  get '/start-game' do
    @visitor = params[:name]
    @player1 = Player.new
    @player1.name = params[:name]
    @player2 = Player.new
    @player2.name = 'COMPUTER'
    erb :startgame
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
