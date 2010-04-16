Feature: Listing and adding information to the What page
	As a RailsCamp attendee
	I want to be able to see what projects people are working on
	And what projects people want to work on
	And add projects and requests for work
	So that I can have a productive RailsCamp
	
Scenario: User is working on a project
	Given that I am viewing the What page
	When I enter a project definition 
	And I enter my name 
	And I click 'I am working on ...'
	Then I should see my project information in on the What page
	
Scenario: User is interested in a topic
	Given that I am viewing the What page
	When I enter what I am interested in working on 
	And I enter my name
	And I click 'I am interested in ..'
	Then I should see my "interested in" information in the What page
	
Scenario: Viewing the page
	Given that there are several projects and interested parties already entered
	When I view the What page
	Then I should see all of the projects and interested parties
