require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1, receive_damage: nil, hp: 100 }
  let(:player_2) { double :player_2, receive_damage: nil, hp: 100 }
  subject(:finished_game) { described_class.new(loser_player, player_2) }
  let(:loser_player) { double :loser_player, hp: 0}


  describe '#attack' do
    it 'should reduce the opponent HP by the default amount' do
      expect(player_1).to receive(:receive_damage)
      game.attack(player_1)
    end

    it 'should switch turns after attacking' do
      expect{ game.attack(player_2) }.to change{ game.current_turn }.to(player_2)
    end

    describe "#game_over?" do
      it 'returns false if no-one has 0HP' do
        expect(game.game_over?).to be false
      end

      it 'returns true if one player has 0HP' do
        expect(finished_game.game_over?).to be true
      end
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
end