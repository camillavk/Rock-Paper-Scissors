require 'sinatra/base'
require_relative 'player'
require_relative 'game'
require_relative 'rock'
require_relative 'scissors'
require_relative 'paper'
require_relative 'spock'
require_relative 'lizard'

class RPS < Sinatra::Base
	set :views, Proc.new { File.join(root, '..', "views") }
	set :public_dir, Proc.new { File.join(root, '..', "public")}
	set :public_folder, 'public'
	enable :sessions

  GAME = Game.new([Rock.new, Paper.new, Scissors.new, Spock.new, Lizard.new])

  get '/' do
  	@player1 = GAME.player1.name unless GAME.player1.nil?
    @player2 = GAME.player2.name unless GAME.player2.nil?
    @player = session[:player]
    erb :index
  end

  get '/new_player' do
    player = session[:player]
    erb :new_player
  end

  post '/new_player' do
    player = Player.new
    player.name = params[:playername]
    session[:player] = params[:playername]
    GAME.add_player(player)
    redirect '/'
  end

  get '/game' do
  	@player = session[:player] unless session[:player].nil?
    session[:type] = "solo"
    erb :game
  end

  get '/game_multiplayer' do
    @player = session[:player] unless session[:player].nil?
    session[:type] = "multi"
    erb :game
  end

  post '/choice' do
    # if params[:choice].nil?
    #   redirect '/end_game'
    # else
      choice_name = params[:choice]
      choice = GAME.choices.find{|choice| choice.name == choice_name}
      if session[:player] == GAME.player1.name  
         GAME.player1.select(choice)
      elsif session[:player] == GAME.player2.name
         GAME.player2.select(choice)
      end
      redirect '/end_game'
    # end
  end

  get '/end_game' do
    @player1 = GAME.player1.name unless GAME.player1.nil?
    @player2 = GAME.player2.name unless GAME.player2.nil?
    @choice1 =  GAME.player1.choice
      if session[:type] == "solo"
         @choice2 = GAME.random_choice
      elsif session[:type] == "multi"
          @choice2 = GAME.player2.choice unless GAME.player2.nil?
      end
  	erb :end_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
