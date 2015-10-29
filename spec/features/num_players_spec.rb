require 'spec_helper'

feature 'choose number of players' do
  scenario '2 players' do
  	clikck_button 'Single Player'
   	expect(page).to have_content 'Almighty Tom vs. AI'
  end
  scenario 'q players' do
   	clikck_button 'Multiplayer'
    expect(page).to have_content 'Almighty Tom vs. Incredible Yev'
  end
end