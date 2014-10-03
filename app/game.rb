require 'sinatra/base'
require_relative 'player'


class RPS < Sinatra::Base
	set :views, Proc.new { File.join(root, '..', "views") }
	enable :sessions

  get '/' do
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


  # start the server if ruby file executed directly
  run! if app_file == $0
end
