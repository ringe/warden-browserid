require 'net/https'

module Warden
  module BrowserId
    #
    # A Warden Strategy to authenticate with BrowserId from Mozilla
    #
    class Strategy < Warden::Strategies::Base
      def valid?
        # Not valid when the assertion parameter is missing
        return false unless params[:assertion]

        # Prepare the HTTP request
        http = Net::HTTP.new(Strategy.browserid_url, 443)
        http.use_ssl = true
        req = Net::HTTP::Post.new("/verify")
        req.set_form_data( { assertion: params[:assertion], audience: request.host_with_port } )

        # POST args to verifier and get response
        response = http.request(req)

        json = JSON.parse response.body
        @asserted = json

        # Return true if asserted email and audience is right
        json["status"] == "okay" and json["audience"] == request.host_with_port
      end

      # Authenticate user if email was verified
      def authenticate! 
        u = User.find_by_email(@asserted["email"])
        u.nil? ? fail!("The given email is not registered for this system.") : success!(u)
      end

      # Select BrowserID verifier instance from options
      def self.browserid_url
        begin
          request.env['warden'].config.browserid_url
        rescue NameError
          "dev.diresworb.org"
        end
      end
    end
  end
end
