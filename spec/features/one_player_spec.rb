require 'spec_helper'

feature 'Enter name' do
  scenario 'submitting name' do
   	sigh_in_and_play_single
    expect(page).to have_content 'Almighty Tom vs. Computer'
  end
end