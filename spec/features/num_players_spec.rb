require 'spec_helper'

feature 'choose number of players' do
  scenario 'Single player' do
    sigh_in_and_play_single
   	expect(page).to have_content 'Almighty Tom vs. Computer'
  end
  scenario 'Multiplayer' do
    sigh_in_and_play
    expect(page).to have_content 'Almighty Tom vs. Incredible Yev'
  end
end