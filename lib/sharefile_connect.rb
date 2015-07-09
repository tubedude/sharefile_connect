require 'dotenv'
Dotenv.load
require 'httparty'
require 'oauth2'
require 'net/https'
require 'uri'

Dir[File.dirname(__FILE__) + '/sharefile_connect/*.rb'].each do |file|
  require file
end

module SharefileConnect
  BASE_URI = "https://#{ENV['API_ENDPOINT_DOMAIN']}.sf-api.com/sf/v3"
end

