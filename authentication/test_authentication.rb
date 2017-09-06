require 'rest-client'
require 'awesome_print'
require_relative '../config'

puts RestClient.get(@api_url + "contacts.json", authorization: "Bearer #{@authentication_key}").code
