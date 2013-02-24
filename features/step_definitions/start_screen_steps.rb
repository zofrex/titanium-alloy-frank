Given /^I am on the start screen$/ do
  # noop
end

Then /^I should see the start button$/ do
  assert_button "Start"
end

Given /^I press the start button$/ do
  touch_button "Start"
end
