#!/usr/bin/env ruby

require 'rubygems'
require '/usr/lib/ruby/gems/1.8/gems/twitter_oauth-0.4.3/lib/twitter_oauth.rb'

# register an app here https://dev.twitter.com/apps/new to get consumer key
# your oauth token can be found under your applications / my access token

Twitter.configure do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.oauth_token = ''
  config.oauth_token_secret = ''
end

Twitter.user
