@register
Feature: Register New BBC user
  As a user
  I want to be able to register to the BBC site to obtain a BBC iD
  So I can get the most out of the iPlayer site

# pre-requisites

Background: navigating to register page for a new user
  Given I am in the BBC iPlayer homepage
  When I click on 'Sign In'
  Then I should arrive to the 'Sign in - BBC iD' page
  And when I click on the link on 'Don't have a BBC iD? Please register.'
  Then I should arrive to the 'Register - BBC iD' page

# user story test cases

Scenario: Register successfully with an existing email and a new password (end to end happy path)
  Given I already have set up an email address set up
  When I type that email address into the Email field
  And I type a password which is valid ie more than 6 characters : 'Abcd!1234'
  And retype it in 'Confirm password'
  And press 'Register'
  Then I should be taken to the Your registration is complete page
  And I should recieve an email
  And I should be able to log out


Scenario: Verify that previously registered emails aren't retyped (negative)
  Given I have an already registered BBC iD user with an email address
  When I type that email address into the Email field
  Then a validation message should appear: 'This email address is already registered'

Scenario: Verify that an email address not registered with BBC before can be typed
  Given I have an email address not registered with BBC before
  When I type that email address into the Email field
  Then no label hint shows

Scenario Outline: Verify that there are validation checks on the format of the email/username (negative)
  When I type in the email field - '<email>', which <test>
  Then an orange exclamation mark shows on the field
  And there's a validation message for email showing - '<validation message>'

  Examples:
    | email       | test                                            | validation message               |
    | steve@      | does not have an <string>.<string> following it | This isn't quite an email address|
    | steve@gmail | does not have an .<string> following it         | This email address is not valid  |


Scenario: Verify that there are validation messages even when nothing is entered into the email and password fields
  When I type in the email field - '', which tests that the validation messages appear when the fields are not entered and Register pressed
  And press 'Register'
  Then there should be 2 validation messages one for the email and one for the password

Scenario Outline: Verify that there are validation checks on the password entered (negative)
  When I type in the New password field - '<password>', which <test>
  Then there's a validation message for password showing - '<validation message>'

  Examples:
    | password                                            | test                                                         | validation message         |
    | a                                                   | 1 character, below the 6 character minimum for a password    | This is too short          |
    | abdce                                               | 5 characters, below the 6 character minimum for a password   | This is too short          |
    | axczczxczxczxzczxczxczxczxczxczxczczxczxczx!@£$1234 | 51 characters, above the 50 character maximum for a password | This is too long           |
    | axczczxczxczxz!@£$1234xczxczxczxczczxczxczxczxbnb   | 49 characters, below the 50 character minimum for a password | N/A                        |
    |                                                     | is null                                                      | N/A                        |

    # Although a tester would say that with nothing typed in (in the last scenario outline) the validation message should be 'please enter a password'


