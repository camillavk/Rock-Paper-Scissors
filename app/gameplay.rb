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
    # erb :game
    redirect '/game'
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

  post '/choice' do
    if params[:option].nil?
      redirect '/end_game'
    else
      option_name = params[:option]
      option = GAME.options.find{|option| option.name == option_name}
      if session[:me] == GAME.player1.name  
         GAME.player1.select(option)
      elsif session[:me] ==  GAME.player2.name
         GAME.player2.select(option)
      end
      redirect '/end_game'
    end
  end


  get '/end_game' do
    @player1 = GAME.player1.name unless GAME.player1.nil?
    @player2 = GAME.player2.name unless GAME.player2.nil?
    @choice1 =  GAME.player1.choice
      if session[:type] == "solo"
         @option2 = GAME.random_option
      elsif session[:type] == "multi"
          @option2 = GAME.player2.option unless GAME.player2.nil?
      end
  	erb :end_game
  end

  # get '/new_game/result' do
  #   @player1 = GAME.player1.name unless GAME.player1.nil?
  #   @player2 = GAME.player2.name unless GAME.player2.nil?
  #   @option1 =  GAME.player1.option
  #     if session[:type] == "solo"
  #        @option2 = GAME.random_option
  #     elsif session[:type] == "multi"
  #         @option2 = GAME.player2.option unless GAME.player2.nil?
  #     end
  #   erb :result
  # end

  #####

  # get '/new_game' do
  #   @player = session[:me] unless session[:me].nil?
  #   session[:type] = "solo"
  #   erb :new_game
  # end

  # get '/new_game_multiplayer' do
  #   @player = session[:me] unless session[:me].nil?
  #   session[:type] = "multi"
  #   erb :new_game
  # end

  # post '/new_game/new_player' do
  #   player = Player.new
  #   player.name = params[:player_name]
  #   session[:me] = params[:player_name]
  #   GAME.add_player(player)
  #   redirect '/'
  # end


  # get '/new_game/result' do
  #   @player1 = GAME.player1.name unless GAME.player1.nil?
  #   @player2 = GAME.player2.name unless GAME.player2.nil?
  #   @option1 =  GAME.player1.option
  #     if session[:type] == "solo"
  #        @option2 = GAME.random_option
  #     elsif session[:type] == "multi"
  #         @option2 = GAME.player2.option unless GAME.player2.nil?
  #     end
  #   erb :result
  # end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
