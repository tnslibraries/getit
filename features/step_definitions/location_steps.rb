Given(/^I am off campus$/) do
  # Stub an IP that is always off-campus
  ENV['RAILS_TEST_IP_ADDRESS'] = '127.0.0.1'
end

Given(/^I am at (.+)$/) do |location|
  ip = ip_for_location(location)
  # If a location IP was found then stub it
  if ip.present?
    ENV['RAILS_TEST_IP_ADDRESS'] = ip
  else
  # If no IP was found, visit the institution page
    visit root_path('umlaut.institution' => institution_for_location(location))
  end
end

Then(/^I should see the NYU New York view$/) do
  expect(html).to have_content "NYU Libraries"
end

Then(/^I should see the NYU Abu Dhabi view$/) do
  expect(html).to have_content "NYU Abu Dhabi Library"
end

Then(/^I should see the NYU Shanghai view$/) do
  expect(html).to have_content "NYU Shanghai Library"
end

Then(/^I should see the New School view$/) do
  expect(html).to have_content "New School Libraries"
end

Then(/^I should see the Cooper Union view$/) do
  expect(html).to have_content "Cooper Union Library"
end

Then(/^I should see the NYSID view$/) do
  expect(html).to have_content "New York School of Interior Design Library"
end
