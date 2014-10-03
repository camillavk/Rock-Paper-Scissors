Given(/^I have signed up$/) do
  visit '/new_player'
  fill_in :playername, :with => :playername
  click_button "Register"
end

When(/^I click on "(.*?)"$/) do |text|
  click_link text
end

Then(/^I should  go to the game page$/) do
  expect(current_path).to eq('/game')
end

Given(/^I am on the game page$/) do
  visit '/game'
end

When(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I should find "(.*?)" and "(.*?)" and "(.*?)"$/) do |one, two, three|
  expect(page).to have_content one
  expect(page).to have_content two
  expect(page).to have_content three
end

When(/^I click one of the choices$/) do
  click_link "Rock"
end

Then(/^I should be taken to end game page$/) do
  expect(current_path).to eq('/end_game')
end

Given(/^I have chosen "(.*?)"$/) do |arg1|
  visit '/game'
  click_link "Rock"
end

When(/^I am taken to the end game page$/) do
  expect(current_path).to eq('/end_game')
end

Then(/^I will see "(.*?)"$/) do |text|
  expect(page).to have_content text
end