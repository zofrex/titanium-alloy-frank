Given /^I am on the start screen$/ do
  if element_is_not_hidden("button marked:'Start'") != true
    restart_simulator
    element_is_not_hidden("button marked:'Start'").should be_true
  end
end

Then /^I should see the start button$/ do
  assert_button "Start"
end

Given /^I press the start button$/ do
  touch_button "Start"
end
