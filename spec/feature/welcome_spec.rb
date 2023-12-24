require 'rails_helper'

RSpec.describe 'welcome', type: :feature, js: true do

  scenario 'when user opens the page' do
    visit welcome_index_path(locale: I18n.default_locale)

    expect(page).to have_text(/devphilipe/i)
  end

  scenario 'when user try to changes carousel content', driver: :selenium_chrome do
    visit welcome_index_path(locale: I18n.default_locale)
    current_content = find(".carousel-on")

    find(".works-button-right").click
    sleep 1
    new_content = find(".carousel-on")

    expect(new_content).not_to eq(current_content)
  end
end