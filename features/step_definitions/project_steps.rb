Then /^I should see (\d)+ projects$/ do |number|
  all('section.project').size.should == number.to_i
end
