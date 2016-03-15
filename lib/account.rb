class Account < BBCBase
  def visit_page
    visit('id/signin')
  end

  def username(id)
    @browser.text_field(id: id)
  end

  def password(id)
    @browser.text_field(id: id)
  end

  def submit_button(value, status = '')
    @browser.button(class: "bbcid-button submit#{status}", value: value)
  end

  def signin
    submit_button("Sign in")
  end

  def register(status = '')
    submit_button("Register",status)
  end

  def account_header(title)
    @browser.div(class: "bbcid-header").h1(text: title)
  end

  def text_shown
    @browser.div(class: "bbcid-content").text
  end

  def register_link
    @browser.link(href: "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer")
    #@browser.link(text: "register")
  end

  def your_account
    @browser.link(id: "idcta-link")
  end

  def sign_out
    @browser.link(class: "id4-cta-signout")
  end

  def error_label
    @browser.div(class: "bbcid-error").label
  end

  def warning_label(section)
    @browser.div(class: "#{section} bbcid-warning").label
  end

  def already_exists_message
    error_label.span(class: "bbcid_validation_service_emailexists")
  end

  def email_address_invalid
    warning_label("email-container").span(class: "bbcid_validation_format_emailaddress")
  end

  def password_too_short_message
    warning_label("createpassword-container").span(class: "bbcid_validation_stringlength_greaterthan5")
  end

  def password_too_long_message
    warning_label("createpassword-container").span(class: "bbcid_validation_stringlength_lessthan51")
  end

  def tab_out
    @browser.send_keys :tab
  end

  def sign_out_confirmation
    @browser.div(class: "bbcid-content signedout-icon")
  end
end