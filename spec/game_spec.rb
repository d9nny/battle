require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  subject(:finished_game) { described_class.new(loser_player, player_2) }
  subject(:one_player_game) {described_class.new(player_1, computer)}
  let(:player_1) do
    double :player,
      receive_basic: nil,
      receive_sleep: nil,
      receive_poison: nil,
      attack_paralyse: nil,
      hp: 100
  end
  let(:player_2) do
    double :player,
      receive_basic: nil,
      receive_sleep: nil,
      receive_poison: nil,
      attack_paralyse: nil,
      hp: 100
  end
  let(:computer) do
    double :player,
      name: "Computer",
      receive_basic: nil,
      receive_sleep: nil,
      receive_poison: nil,
      attack_paralyse: nil,
      hp: 100
  end
  let(:loser_player) { double :loser_player, hp: 0}

  describe '#attack_basic' do
    it 'should delegate basic attck to game class' do
      expect(player_1).to receive(:receive_basic)
      game.attack_basic(player_1)
    end
  end

  describe '#attack_poison' do
    it 'should delegate poison attack to game class' do
      expect(player_1).to receive(:receive_poison )
      game.attack_poison(player_1)
    end
  end

  describe '#attack_sleep' do
    it 'should delegate sleep attack to game class' do
      expect(player_1).to receive(:receive_sleep)
      game.attack_sleep(player_1)
    end
  end

  describe '#attack_paralyse' do
    it 'should delegate paralyse attack to game class' do
      expect(player_1).to receive(:receive_paralyse)
      game.attack_paralyse(player_1)
    end
  end
  it 'should switch turns after attacking' do
    game.switch_turn
    expect(game.current_turn).to eq player_2
  end

  describe "#game_over?" do
    it 'returns false if no-one has 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if one player has 0HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe 'player instance variables' do
    it 'retrieves player_1' do
      expect(game.player_1).to eq player_1
    end
    it 'retrieves player_2' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#opposite_player' do
    it 'has an opposite player as player 2' do
      expect(game.opposite_player).to eq player_2
    end
  end

  describe '#computer?' do
    it 'confirms if a player is the computer' do
      one_player_game.switch_turn
      expect(one_player_game.computer?).to be true
    end
  end

  describe '#random_attack' do
    it 'chooses a random attack' do
      expect(player_1).to receive(:receive_random)
      one_player_game.attack_random(player_1)
    end
  end

  describe '#sleeping' do
    it 'lets us know if the player is sleeping' do
      allow(player_1).to receive(:sleeping?).and_return(true)
      expect(game.sleeping?(player_1)).to be true
    end
  end

  describe '#reduce_sleep_counter' do
    it 'decrements a players sleep counter' do
      expect(player_1).to receive(:reduce_sleep_counter)
      game.reduce_sleep_counter(player_1)
    end
  end
end
