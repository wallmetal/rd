
Given(/^there's a contact with email "([^"]*)" and the visitor_cookie "([^"]*)"$/) do |email, visitor_cookie|
  @contact = FactoryGirl.create(:contact, "email" => email)
  FactoryGirl.create(:contact_identification, "contact_id" => @contact.id, "visitor_cookie"=>visitor_cookie)
end

When(/^I click on the contact of id "([^"]*)"$/) do |id|
  visit '/contact/'+id
end

Then(/^I should see the message "([^"]*)"$/) do |message|
  expect(page).to have_content(message)
end
