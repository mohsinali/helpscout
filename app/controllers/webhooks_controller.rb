class WebhooksController < ApplicationController
  require 'hmac-sha1'

  def helpscout
    signature = "+oNIxipGoqx4t2BmkBHbXKc6VHM="
    data = '{"ticket":{"id":"1","number":"2"},"customer":{"id":"1","fname":"Jackie","lname":"Chan","email":"jackie.chan@somewhere.com","emails":["jackie.chan@somewhere.com"]}}'
    
    puts "This request came from Help Scout:"
    puts is_from_help_scout(data, signature)

    puts "===================================="
    puts request.headers["Content-Type"]
    # render layout: false
  end


  private
    def is_from_help_scout(data, signature)
      hmac = HMAC::SHA1.new(ENV["SECRET_KEY_BASE"])
      hmac.update(data)
      Base64.encode64("#{hmac.digest}").strip == signature.strip
    end
end
