Given(/^I am in the BBC iPlayer homepage$/) do
  @page = site.signin_page
  site.iplayer_home.visit_page
end

Given(/^I already have set up an email address set up$/) do
  @page = site.signin_page
  ENV['EMAIL'] = "#{Time.now.to_i}-test@example.com"
end

Given(/^I have an already registered BBC iD user with an email address$/) do
  @page = site.signin_page
  if ENV['REG_STATUS'] != "registered"
    steps %(
      Given I already have set up an email address set up
      When I type that email address into the Email field
      And I type a password which is valid ie more than 6 characters : '1234567'
      And retype it in 'Confirm password'
      And press 'Register'
      Then I should be taken to the Your registration is complete page
      And I should recieve an email
    )
  end
end

Given(/^I have an email address not registered with BBC before$/) do
  @page = site.signin_page
  steps %(Given I already have set up an email address set up)
end