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

