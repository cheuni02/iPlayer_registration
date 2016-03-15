module BBCHeader
  class Header

    def initialize(browser)
      @browser = browser
    end


    def orb_header
      @browser.div(id: "orb-header")
    end

    class MyBBC < Header

      def initialize(browser)
        @browser = browser
      end


      def my_bbc
        orb_header.div(id: "mybbc-wrapper")
      end

      def sign_in
        my_bbc.link(id: "idcta-link")
      end

      def notification_link
        my_bbc.link(id: "notification-link")
      end
    end


  end





end