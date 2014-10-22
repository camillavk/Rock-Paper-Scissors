Given(/^I have signed up$/) do
  visit '/new_player'
  fill_in :playername, :with => :playername
end

When(/^I click on "(.*?)"$/) do |text|
  click_button "Register"
end

Then(/^I should  go to the game page$/) do
  expect(current_path).to eq('/')
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
  choose("choice", :option => "Rock")
  click_button "Lets go!"
end

Then(/^I should be taken to end game page$/) do
  expect(current_path).to eq('/end_game')
end

Given(/^I have chosen one of the options$/) do
  visit '/game'
  choose("choice", :option => "Rock")
  click_button "Lets go!"
end

When(/^the computer should also generate a choice$/) do
  expect(page).to have_content @game_choice
end

Then(/^it should be able to compare them and declare a winner$/) do
  expect(page).to have_content 
end

