require 'sinatra'
require 'httparty'
require 'json'

get '/anonymize' do
  postback params[:text], params[:channel_id]
  status 200
end

# get '/anonymize' do
#   content_type :json
#   {:text => params[:text], :response_type => "in_channel"}.to_json
# end

def postback(message, channel)
  slack_webhook = ENV['SLACK_WEBHOOK_URL']
  HTTParty.post slack_webhook, body: { 'text' => message.to_s, 'username' => 'John Doe', 'channel' => params[:channel_id]}.to_json, headers: { 'content-type' => 'application/json' }
end
