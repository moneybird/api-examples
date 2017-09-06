require 'rest-client'
require 'awesome_print'
require_relative '../config'
require 'csv'

CSV.foreach('create_contact/contacts.csv') do |contact|
  response = RestClient.post(@api_url + 'contacts.json', { contact: { company_name: contact[0], send_invoices_to_email: contact[1], city: contact[2] } }, authorization: "Bearer #{@authentication_key}")

  if response.code == 201
    puts "Contact #{contact[0]} created"
  else
    puts "Failed to create contact"
    puts response.body
  end
end
