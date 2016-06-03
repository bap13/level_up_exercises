Given(/^the bomb has not been activated$/) do
  
end

When(/^I visit the homepage$/) do
  visit('/')
end

Then(/^I should see an activation field$/) do
  expect(page).to have_content('Inactive')
end