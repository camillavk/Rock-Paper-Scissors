require 'sinatra/base'
require_relative 'player'
require_relative 'game'


class RPS < Sinatra::Base
	set :views, Proc.new { File.join(root, '..', "views") }
	set :public_dir, Proc.new { File.join(root, '..', "public")}
	set :public_folder, 'public'
	enable :sessions

  GAME = Game.new

  get '/' do
  	@player = session[:player]
    erb :index
  end

  post '/' do
  	session[:player] = Player.new
  	@player = session[:player]
  	@playername = params[:playername]
  	erb :index
  end

  get '/new_player' do
  	player = session[:player]
  	erb :new_player
  end

  get '/game' do
  	player = session[:player]
    # @choice = player.choice
    @game_choice = session[:game_choice]
    @outcome = session[:outcome]
    erb :game
  end


  post '/game' do 
    player = session[:player]
  	player.choice = params[:choice].to_s
    @game_choice = GAME.random
    session[:game_choice] = game_choice
    session[:outcome] = GAME.outcome(player_choice, game_choice)
  	erb :game
  end

  get '/end_game' do
    player = session[:player]
  	erb :end_game
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
