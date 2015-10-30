require 'spec_helper'

feature 'Switching' do
  scenario 'switchs turns' do
    sigh_in_and_play
    attack_and_confirm
    click_button('Attack')
    expect(page).to have_content 'Incredible Yev performs a basic attack on Almighty Tom!'
  end
end