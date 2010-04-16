require "webrat"

Webrat.configure do |config|
  config.mode = :rails
end

Given /^that I am viewing the What page$/ do
  visit '/'
end

When /^I enter a project definition$/ do
  fill_in "Submission", :with => 'My Project'
end

When /^I enter my name$/ do
  fill_in 'Name', :with => 'Bob Bobson'
end

When /^I click 'I am working on \.\.\.'$/ do
  click_button 'I am working on ...'
end

Then /^I should see my project information in on the What page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I enter what I am interested in working on$/ do
  fill_in "Submission", :with => 'I like stuff'
end

When /^I click 'I am interested in \.\.'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see my "([^\"]*)" information in the What page$/ do |arg1|
  click_button 'I am working on ...'
end

Given /^that there are several projects and interested parties already entered$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I view the What page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see all of the projects and interested parties$/ do
  pending # express the regexp above with the code you wish you had
end
