require 'sinatra/base'
require_relative 'player'


class RPS < Sinatra::Base
	set :views, Proc.new { File.join(root, '..', "views") }
	set :public_dir, Proc.new { File.join(root, '..', "public")}
	set :public_folder, 'public'
	enable :sessions

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
  	@player = session[:player]
  	erb :new_player
  end

  get '/game' do
  	@player = session[:player]
  	@playername
  	erb :game
  end

  get '/end_game' do
  	erb :end_game
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
