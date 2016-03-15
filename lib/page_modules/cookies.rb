module Cookies
  class Cookies_banner
    include PageObject

    def initialize(browser)
      @browser = browser
    end

    #button(:continue_button,:id => "bbccookies-continue-button")

    def object
      @browser.div(:id => "blq-global")
    end

    def title
      @browser.h2(:class => "orb-banner-title")
    end

    def statement
      @browser.p(:class => "orb-banner-content")
    end

    def continue_button
      @browser.button(:id => "bbccookies-continue-button")
    end

    def settings_link
      @browser.link(:href => "/privacy/cookies/managing/cookie-settings.html")
    end

    def find_out_more_link
      @browser.link(:href => "/privacy/cookies/bbc")
    end
  end
end

