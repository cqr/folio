Then /^I should not be logged in$/ do
  Then "I should not see \"Logout\""
end

Then /^I should be logged in$/ do
  Then "I should see \"Logout\""
end