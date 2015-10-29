require 'player'

describe Player do
  subject(:player_1) { described_class.new(player_1_name)}
	let(:player_1_name) {"Yev"}
  subject(:player_2) { described_class.new(player_2_name)}
  let(:player_2_name) {"Andy"}

	describe '#initialize' do
		it {is_expected.to respond_to(:name)}
  end

  describe '#hp' do
    it 'is expected to have default hit points' do
      expect(player_1.hp).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_damage' do
    it 'should reduce the players hp by the default amount' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect{ player_1.receive_damage }.to change{ player_1.hp }.by -10
    end
  end


end


