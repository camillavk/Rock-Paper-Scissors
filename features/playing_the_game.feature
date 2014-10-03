Feature: Playing the game
	In order to win Rock Paper Scissors
	As a player
	I want to choose between Rock, Paper and Scissors

Scenario: Entering the game
	Given I have signed up
	When I click on "Bring it on!"
	Then I should  go to the game page

Scenario: Given a choice
	Given I am on the game page
	When I see "Take your pick"
	Then I should find "Rock" and "Paper" and "Scissors"


