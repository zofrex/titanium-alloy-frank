def app_path
  ENV['APP_BUNDLE_PATH'] || (defined?(APP_BUNDLE_PATH) && APP_BUNDLE_PATH)
end

Given /^I launch the app$/ do
  # latest sdk and iphone by default
  launch_app app_path
end

Given /^I launch the app using iOS (\d\.\d)$/ do |sdk|
  # You can grab a list of the installed SDK with sim_launcher
  # > run sim_launcher from the command line
  # > open a browser to http://localhost:8881/showsdks
  # > use one of the sdk you see in parenthesis (e.g. 4.2)
  launch_app app_path, sdk
end

Given /^I launch the app using iOS (\d\.\d) and the (iphone|ipad) simulator$/ do |sdk, version|
  launch_app app_path, sdk, version
end

def touch_button(name)
  touch "view marked:'#{name}'"
end

Given /^I touch hello$/ do
  touch_button "Hello, World"
end

def alert
  sleep 1
  check_element_exists "view:'UIAlertView'"
end

Then /^I should see an alert$/ do
  alert
end

Given /^I am viewing the alert$/ do
  alert
end

Given /^I clear it$/ do
  touch_button "OK"
end

Then /^I should not see an alert$/ do
  sleep 1
  check_element_does_not_exist_or_is_not_visible "view:'UIAlertView'"
end
