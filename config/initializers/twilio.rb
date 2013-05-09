# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]
