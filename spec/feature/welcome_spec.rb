require 'rails_helper'

RSpec.describe 'welcome', type: :feature, js: true do

  scenario 'when user opens the page' do
    visit welcome_index_path(locale: I18n.default_locale)

    expect(page).to have_text(/devphilipe/i)
  end

  scenario 'shows carousel correctly', driver: :selenium_chrome do
    visit welcome_index_path(locale: I18n.default_locale)
    expect(page).to have_selector('.owl-carousel')
  end

  scenario 'when navigates on carousel partial works', driver: :selenium_chrome do
    visit welcome_index_path(locale: I18n.default_locale)
    carousel_element = find(".owl-carousel")
    current_contents = carousel_element.all(".owl-item.active")
    current_contents_texts = current_contents.map(&:text)

    page.driver.browser.action.click_and_hold(current_contents.first.native)
        .move_by(100, 0)
        .release
        .perform
    sleep 1
    new_contents = carousel_element.all(".owl-item.active")
    new_contents_texts = new_contents.map(&:text)

    expect(new_contents_texts).not_to eq(current_contents_texts)
  end

  scenario 'when user opens a card from carousel' do
    visit welcome_index_path(locale: I18n.default_locale)
    raw_item = find(".owl-item.active", match: :first).text

    find(".owl-item.active", match: :first).click

    item_changed = find(".owl-item.active", match: :first).text

    expect(raw_item).not_to eq(item_changed)
  end
end