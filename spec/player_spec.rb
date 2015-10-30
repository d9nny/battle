require 'player'

describe Player do
  subject(:player) do
    described_class.new(player_name)
  end
	let(:player_name) {"Yev"}

	describe '#initialize' do
		it {is_expected.to respond_to(:name)}
  end

  describe '#hp' do
    it 'is expected to have default hit points' do
      expect(player.hp).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_basic' do
    it 'should reduce the players hit points' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect {player.receive_basic}.to change {player.hp}.by -10
    end
  end
  describe '#receive_poison' do
    it 'should reduce the players hit points' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect {player.receive_poison}.to change {player.hp}.by -10
    end
  end
  describe '#receive_paralyse' do
    it 'should paralyse the player' do
      player.receive_paralyse
      expect(player.paralysed?).to be true
    end
  end
  describe '#receive_sleep' do
    it 'should make a player sleep' do
      player.receive_sleep
      expect(player.sleeping?).to be true
    end
  end
end

