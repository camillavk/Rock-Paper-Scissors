Feature: Ending the game
	In order to win the game
	As a player
	I need to beat the computer's choice

@ignore
Scenario: I can win
	Given I have chosen "Rock"
	When I am taken to the end game page
	Then I will see "Congratulations"