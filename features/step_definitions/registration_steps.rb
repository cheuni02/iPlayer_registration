When(/^I click on 'Sign In'$/) do
  site.my_bbc.sign_in.click
end

Then(/^I should arrive to the 'Sign in \- BBC iD' page$/) do
  expect(site.page_url).to match(/https\:\/\/ssl.bbc.co.uk\/id\/signin/)
  expect(site.signin_page.account_header("Sign in").present?).to eq(true)
end

And(/^when I click on the link on 'Don't have a BBC iD\? Please register\.'$/) do
  site.signin_page.register_link.when_present.click
end

Then(/^I should arrive to the 'Register \- BBC iD' page$/) do
  expect(site.page_url).to match(/https\:\/\/ssl.bbc.co.uk\/id\/register/)
  expect(site.signin_page.account_header("Register").present?).to eq(true)
end

When(/^I type that email address into the Email field$/) do
  @page.username("bbcid_email").set(ENV['EMAIL'])
end

And(/^I type a password which is valid ie more than 6 characters : '(.*)'$/) do |password|
  ENV['PW']= password
  @page.password("bbcid_createpassword").set(ENV['PW'])
end

And(/^retype it in 'Confirm password'$/) do
  @page.password("bbcid_confirmpassword").set(ENV['PW'])
end

And(/^press 'Register'$/) do
  Watir::Wait.until {@page.register.present?}
  @page.register.when_present.click
end

Then(/^I should be taken to the (.*) page$/) do |word|
  expect(@page.text_shown).to include(word)
  expect(@page.text_shown).to include('You’re registered as:')
  expect(@page.text_shown).to include(ENV['EMAIL'])
end

And(/^I should recieve an email$/) do
  ENV['REG_STATUS'] ||= "registered"
end

And(/^I should be able to log out$/) do
  @page.your_account.when_present.click
  @page.sign_out.when_present.click
  Watir::Wait.until {@page.sign_out_confirmation.present?}
end


And(/^a validation message should appear: 'This email address is already registered'$/) do
  @page.tab_out
  Watir::Wait.until {@page.already_exists_message.exists?}
  expect(@page.already_exists_message).to be_present
end

When(/^I type in the email field \- '(.*)', which (.*)$/) do |email, test|
  @page.username("bbcid_email").set(email)
end

Then(/^an orange exclamation mark shows on the field$/) do
end

And(/^there's a validation message for (email|password) showing \- '(.*)'$/) do |field, validation_message|
  @page.tab_out
  case field
    when 'email'
      Watir::Wait.until {@page.email_address_invalid.exists?}
      expect(@page.email_address_invalid).to be_present
    when 'password'
      case validation_message
        when 'This is too short'
          Watir::Wait.until {@page.password_too_short_message.exists?}
          expect(@page.password_too_short_message).to be_present
        when 'This is too long'
          Watir::Wait.until {@page.password_too_long_message.exists?}
          expect(@page.password_too_long_message).to be_present
        when 'N/A'
          expect(@page.password_too_long_message).not_to be_present
          expect(@page.password_too_short_message).not_to be_present
      end
  end
end

When(/^I type in the New password field \- '(.*)', which (.*)$/) do |password, test|
  @page.password("bbcid_createpassword").set(password)
end

And(/^no label hint shows$/) do
  expect(@page.already_exists_message).not_to be_present
end

Then(/^there should be (\d+) validation messages one for the email and one for the password$/) do |arg|
  expect(@page.email_address_invalid.present?).to eq(true)
  expect(@page.password_too_short_message.present?).to eq(true)
end