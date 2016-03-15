class BrowserContainer
  def initialize(browser, visit = true)
    @browser = browser
  end

  def visit(path)
    @browser.goto("#{ENV['BBC_HOST']}/" << path)
  end
end