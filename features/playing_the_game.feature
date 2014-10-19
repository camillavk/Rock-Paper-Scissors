Feature: Playing the game
	In order to play Rock Paper Scissors
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

Scenario: I can pick one of the three
	Given I am on the game page
	When I click one of the choices
	Then I should be taken to end game page

Scenario: The computer can randomly generate a choice
	Given I have chosen one of the options
	When the computer should also generates a choice
	Then it should be able to compare them and declare a winner

