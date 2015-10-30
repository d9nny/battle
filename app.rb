require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
class Battle < Sinatra::Base

  get '/' do
  	erb(:index)
  end

  post '/names1' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new("Computer")
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  post '/names2' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/comp' do
    @game = $game
    if @game.current_turn.name != "Computer"
      redirect '/play'
    else
      redirect '/computer_attack'
    end
  end

  post '/one_player' do
    erb :one_player
  end

  post '/two_player' do
  	erb :two_player
  end

  get '/play' do
    @game = $game
    erb(:play)
  end



  get '/computer_attack' do
    @game = $game
    @current_turn = @game.current_turn
    @opposite_player = @game.opposite_player
    @game.attack_basic(@opposite_player)
    redirect '/game_over' if @game.game_over?
    erb(:computer_attack)
  end

  get '/attack_basic' do
    @game = $game
    @current_turn = @game.current_turn
    @opposite_player = @game.opposite_player
    @game.attack_basic(@opposite_player)
    redirect '/computer_attack' if @current_turn.name != "Computer"
    redirect '/game_over' if @game.game_over?
    erb(:attack)
  end

  get '/attack_paralyse' do
    @game = $game
    @current_turn = @game.current_turn
    @opposite_player = @game.opposite_player
    @game.attack_paralyse(@opposite_player)
    redirect '/computer_attack' if @current_turn.name != "Computer"
    redirect '/game_over' if @game.game_over?
    erb(:attack)
  end

  get '/attack_poison' do
    @game = $game
    @current_turn = @game.current_turn
    @opposite_player = @game.opposite_player
    @game.attack_poison(@opposite_player)
    redirect '/computer_attack' if @current_turn.name != "Computer"
    redirect '/game_over' if @game.game_over?
    erb(:attack)
  end

  get '/attack_sleep' do
    @game = $game
    @current_turn = @game.current_turn
    @opposite_player = @game.opposite_player
    @game.attack_sleep(@opposite_player)
    redirect '/computer_attack' if @current_turn.name != "Computer"
    redirect '/game_over' if @game.game_over?
    erb(:attack)
  end


  get '/game_over' do
    @game = $game
    erb(:game_over)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
