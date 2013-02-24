Given /^I am on the start screen$/ do
  # noop
end

Then /^I should see the start button$/ do
  assert_button "Start"
end

Then /^I should see the quit button$/ do
  assert_button "Quit"
end

Given /^I press the quit button$/ do
  touch_button "Quit"
end

Then /^the app should quit$/ do
  wait_for_element_to_not_exist "button marked:'Quit'"
end

Given /^I press the start button$/ do
  touch_button "Start"
end
