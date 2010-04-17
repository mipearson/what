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
  # todo FIX SELECTOR SCOPE
  page.should have_selector('div#projects')
  page.should contain 'My Project'
  page.should contain 'Bob Bobson'
end

When /^I enter what I am interested in working on$/ do
  fill_in "Submission", :with => 'I like stuff'
end

When /^I click 'I am interested in \.\.\.'$/ do
  click_button 'I am interested in ...'
end

Then /^I should see my 'interested in' information in the What page$/ do
  page.should contain 'I like stuff'
  page.should contain 'Bob Bobson'
end

Given /^that there are several projects and interests already entered$/ do
  Submission.create!(:submission => 'Thing', :name => 'Bob', :kind => 'project')
  Submission.create!(:submission => 'Stuff', :name => 'Steve', :kind => 'interest')
end

When /^I view the What page$/ do
  visit '/'
end

Then /^I should see all of the projects and interests$/ do
  page.should contain 'Thing'
  page.should contain 'Bob'
  page.should contain 'Stuff'
  page.should contain 'Steve'
end

Given /^that there is a submission that I wish to delete$/ do
  @delete_candidate = Submission.create!(:submission => 'cocks', :name => 'Mister Cock', :kind => 'project')
end

When /^I delete that submission$/ do
  within("#submission_#{@delete_candidate.id}") do
    click 'x'
  end
end

Then /^that submission should no longer be present on the What page$/ do
  page.should_not contain 'cocks'
end
