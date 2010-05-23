Then /^I should not be logged in$/ do
  Then "I should not see \"Logout\""
end

Then /^I should be logged in$/ do
  Then "I should see \"Logout\""
end

Given /^I am logged in$/ do
  Given "I am at \"/login\""
  When "I fill in \"username\" with \"chrisrhoden\""
  When "I fill in \"password\" with \"mypass\""
  When "I press \"Login\""
end
