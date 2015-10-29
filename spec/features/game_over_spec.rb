require 'spec_helper'

feature 'Game over' do
  context 'when Player 2 reaches 0HP first' do
    before do
      sigh_in_and_play
      attack_and_confirm
      allow(Kernel).to receive(:rand).and_return(100) 
    end
  
    scenario 'Player 2 loses' do
      click_button('Attack')
      expect(page).to have_content 'Almighty Tom loses!'
    end
  end
end
