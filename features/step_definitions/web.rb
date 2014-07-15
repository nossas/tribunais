Given(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in to_field(arg1), with: arg2
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button to_button(arg1)
end

When(/^I go to "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Then(/^I should be in "(.*?)"$/) do |arg1|
  expect(current_path).to be_eql to_url(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_css(to_element(arg1))
end
