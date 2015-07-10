# require 'dotenv'
# Dotenv.load
require 'httparty'
require 'net/https'
require 'uri'

Dir[File.dirname(__FILE__) + '/sharefile_connect/*.rb'].each do |file|
  require file
end

module SharefileConnect
end

