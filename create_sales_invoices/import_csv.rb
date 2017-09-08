require 'rest-client'
require 'awesome_print'
require_relative '../config'
require 'csv'

csv_sales_invoices = CSV.read('create_contact/contacts.csv')

csv_sales_invoices.each do |sales_invoice|
  contact_response = RestClient.get(@api_url + "contacts/customer_id/#{sales_invoice[0]}.json")
  contact_id = JSON.parse(contact_response)["id"]

  detail = { amount: sales_invoice[2], description: sales_invoice[3], price: sales_invoice[4] }
  data = { contact_id: contact_id, reference: sales_invoice[1], details_attributes: { 1 => detail } }
  response = RestClient.post(@api_url + 'sales_invoices.json', { sales_invoice: data }, authorization: "Bearer #{@authentication_key}")

  if response.code == 201
    puts "Sales invoice #{contact[1]} created"
  else
    puts "Failed to create sales invoice"
    puts response.body
  end
end
