require 'spec_helper'
feature 'Computer attack' do
	let(:game) {double :game}
  scenario 'player 1 and receives confirmation' do
    sigh_in_and_play_single
    attack_and_confirm 
    expect(page).to have_content 'Computer performs a'
  end
end
