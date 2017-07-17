module Appointment
    
    def send_message(number)
        account_sid = 'AC25d1eab9c54f98e27b49e76145798780'
        auth_token = 'a10f83dc36e85901005966cc2d8c7c81'

        # set up
        capability = Twilio::Util::Capability.new account_sid, auth_token

        # allow outgoing calls to an application
        capability.allow_client_outgoing 'AP89a0180a1a4ddf1da954efca349b7a20'

        # allow incoming calls to 'waleedsajid41991'
        capability.allow_client_incoming 'waleedsajid41991'
        @client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new


        # generate the token string
        @token = capability.generate
        message = @client.account.messages.create(
            :from => +353894535936,
            :to => number,
            :body => "Your appointment is confirmed"
            )
    end
    
end