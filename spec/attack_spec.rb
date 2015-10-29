require 'attack'

describe Attack do
  let(:player) { double :player }
  subject(:attack) { described_class.new(player) }

  describe '#run' do
    it 'damages the player' do
      expect(player).to receive(:receive)
      attack.run(:attack)
    end
  end
end