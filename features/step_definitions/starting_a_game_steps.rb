Given(/^I am on the homepage$/) do
	visit '/'
end

When(/^I follow "(.*?)"$/) do |text|
  click_link text
end

Then(/^I should see "(.*?)"$/) do |content|
	expect(page).to have_content content
end

Given(/^I am on the sign up page$/) do
  visit '/new_player'
end

When(/^I enter my name$/) do
  fill_in :playername, :with => :playername
  click_button "Register"
end

When(/^I return to the homepage$/) do
	expect(current_path).to eq('/')
end

Then(/^I should view "(.*?)"$/) do |text|
  expect(page).to have_content text
end