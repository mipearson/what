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
	And I should see confirmation that my submission was received
	
Scenario: User is interested in a topic
	Given that I am viewing the What page
	When I enter what I am interested in working on 
	And I enter my name
	And I click 'I am interested in ...'
	Then I should see my 'interested in' information in the What page
	And I should see confirmation that my submission was received

Scenario: User wishes to delete an entry	
  Given that there is a submission that I wish to delete
	And that I am viewing the What page
	When I delete that submission
	Then that submission should no longer be present on the What page
	And I should see confirmation that a submission was deleted
	
Scenario: Viewing the page
	Given that there are several projects and interests already entered
	When I view the What page
	Then I should see all of the projects and interests