Feature: Starting the game
	In order to play Rock Paper Scissors
	As the Makers Academy Marketing Array
	I want to start a new game

Scenario: Getting started
	Given I am on the homepage
	When I follow "Let's play!"
	Then I should see "What's your name?"

Scenario: Signing up
	Given I am on the sign up page
	When I enter my name
	And I am taken to the home page
	Then I should view "Do you want to play against"


	




