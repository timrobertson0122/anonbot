require 'sinatra'
require 'httparty'
require 'json'

get '/anonymize' do
  postback params[:text], params[:channel_id]
  status 200
end

def postback(message, _channel)
  slack_webhook = ENV['SLACK_WEBHOOK_URL']
  HTTPARTY.post slack_webhook, body: {
    'text' => message.to_s,
    'username' => 'John Doe',
    'channel' => params[:channel_id]
  }.to_json, headers: { 'content-type' => 'application/json' }
end
