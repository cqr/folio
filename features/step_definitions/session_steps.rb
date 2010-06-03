Then /^I should not be logged in$/ do
  Then "I should not see \"Logout\""
end

Then /^I should be logged in$/ do
  Then "I should see \"Logout\""
end

Given /^I am logged in$/ do
  Given "there is one user \"u:p\""
  Given "I am at \"/login\""
  When "I fill in \"username\" with \"u\""
  When "I fill in \"password\" with \"p\""
  When "I press \"Login\""
end

Given /^there is one user "([^\"]*)"$/ do |uandp|
  u, p = uandp.split(':')
  Environment::Config.set('users', {u => p})
end

