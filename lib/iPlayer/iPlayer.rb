class IPlayer < BBCBase

  def visit_page
    visit('iplayer')
  end

  def click_signin
    my_bbc.sign_in.click
  end

end