require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  def load_state
    @game = session[:game]
    @current_turn = @game.current_turn
    @opposite_player = @game.opposite_player
  end

  get '/' do
    erb(:index)
  end

  post '/names1' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new("Computer")
    session[:game] = Game.new(player_1, player_2)
    redirect '/play'
  end

  post '/names2' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    session[:game] = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/comp' do
    @game = session[:game]
    if @game.computer?
      redirect '/computer_attack'
    else
      redirect '/play'
    end
  end

  post '/one_player' do
    erb :one_player
  end

  post '/two_player' do
    erb :two_player
  end

  get '/play' do
    @game = session[:game]
    erb(:play)
  end

  get '/computer_attack' do
    load_state
    redirect '/sleeping' if  @game.sleeping?(@current_turn)
    @attack_type = @game.attack_random(@opposite_player)
    @game.switch_turn
    redirect '/game_over' if @game.game_over?
    erb(:computer_attack)
  end

  post '/attack_basic' do
    load_state
    redirect '/sleeping' if  @game.sleeping?(@current_turn)
    @game.attack_basic(@opposite_player)
    if @game.game_over?
      redirect '/game_over'
    else
      redirect'/attack_basic'
    end
  end

  get '/sleeping' do
    load_state
    @game.switch_turn
    @game.reduce_sleep_counter(@current_turn)
    erb (:sleeping)
  end


  get '/attack_basic' do
    load_state
    @game.switch_turn
    @attack_type = "basic"
    erb(:attack)
  end

  post '/attack_paralyse' do
    load_state
    redirect '/sleeping' if  @game.sleeping?(@current_turn)
    @game.attack_paralyse(@opposite_player)
    if @game.game_over?
      redirect '/game_over'
    else
      redirect'/attack_paralyse'
    end
  end

  get '/attack_paralyse' do
    load_state
    @game.switch_turn
    @attack_type = "paralyse"
    erb(:attack)
  end

  post '/attack_poison' do
    load_state
    redirect '/sleeping' if  @game.sleeping?(@current_turn)
    @game.attack_poison(@opposite_player)
    if @game.game_over?
      redirect '/game_over'
    else
      redirect'/attack_poison'
    end
  end

  get '/attack_poison' do
    load_state
    @game.switch_turn
    @attack_type = "poison"
    erb(:attack)
  end

  post '/attack_sleep' do
    load_state
    redirect '/sleeping' if  @game.sleeping?(@current_turn)
    @game.attack_sleep(@opposite_player)
    if @game.game_over?
      redirect '/game_over'
    else
      redirect'/attack_sleep'
    end
  end

  get '/attack_sleep' do
    load_state
    @game.switch_turn
    @attack_type = "sleep"
    erb(:attack)
  end


  get '/game_over' do
    @game = session[:game]
    erb(:game_over)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
