class BBCBase < BrowserContainer

  include BBCHeader

  def bbc_header
    BBCHeader::Header.new(@browser)
  end

  def my_bbc
    BBCHeader::Header::MyBBC.new(@browser)
  end

  def news_home
    NewsHome.new(@browser,true)
  end

  def iplayer_home
    IPlayer.new(@browser,true)
  end

  def signin_page
    Account.new(@browser,true)
  end

  def page_title
    @browser.title
  end

  def page_url
    @browser.url
  end


end