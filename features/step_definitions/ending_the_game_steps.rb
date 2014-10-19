Given(/^I have chosen "(.*?)"$/) do |text|
  visit '/game'
  click_link "Rock"
end

When(/^I am taken to the end game page$/) do
  expect(current_path).to eq('/end_game')
end

Then(/^I will see "(.*?)"$/) do |text|
  expect(page).to have_content text
end