require 'spec_helper'

feature 'Attacking' do
  scenario 'attacks player 2 with basic attack & receives confirmation' do
    sigh_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Almighty Tom performs a basic attack on Incredible Yev!'
  end
  scenario 'attacks player 2 with paralyse attack & receives confirmation' do
    sigh_in_and_play
    click_button('Paralyse')
    expect(page).to have_content 'Almighty Tom performs a paralyse attack on Incredible Yev!'
  end
  scenario 'attacks player 2 with posison attack & receives confirmation' do
    sigh_in_and_play
    click_button('Poison')
    expect(page).to have_content 'Almighty Tom performs a poison attack on Incredible Yev!'
  end
  scenario 'attacks player 2 with sleep attack & receives confirmation' do
    sigh_in_and_play
    click_button('Sleep')
    expect(page).to have_content 'Almighty Tom performs a sleep attack on Incredible Yev!'
  end
end


