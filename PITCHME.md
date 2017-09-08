---

# Workshop: how to create an API connection with Moneybird

---

Goal of this workshop:

1. Authentication: making the first request
2. Creating a contact by parsing a CSV file
3. Creating a sales invoice by parsing a CSV file

---

Before we start:

- Make sure you have ruby installed:

```
$ ruby -v
```

- Make sure you have git installed:

```
$ git -v
```

- Make sure you have bundler installed:

```
gem install bundler
```

---

- Check out the Github project:

```
$ git checkout git@github.com:moneybird/api-examples.git
```

- Install dependencies:

```
$ bundle install
```

---

Start a Ruby console to start live coding:

```
$ pry
```

---

Require `rest-client` and `json`. This Ruby libraries makes requesting REST API's easier.

```
> require 'rest-client'
=> true
> require 'json'
=> true
```

---

## Connecting with the API

---

- Go to your Moneybird account
- Create a new administration if you don't have an administration for testing purposes
- Go to your user account > developers and create a new personal access token

---

Put your access token and administration id in variables:

```
> @token = '...'
=> "..."
> @administration_id = 0
=> 0
```

---

Put the base URL of the api in a variable for convenience

```
> @api_url = "https://moneybird.com/api/v2/#{@administration_id}/"
"https://moneybird.com/api/v2/0/"
```

---

Ready to test our first request!

```
> response = RestClient.get(@api_url + "contacts.json")
RestClient::Unauthorized: 401 Unauthorized
```

---

Without the authorization header, we don't have access to the API. Add an `authorization` header to authorize yourself:

```
> response = RestClient.get(@api_url + "contacts.json", authorization: "Bearer #{@token}")
=> <RestClient::Response 200 "[{\"id\":\"106...">
> response.code
=> 200
```

---

The last request also lists the contacts in your account. To see the result, we need to parse it:

```
> response.body
=> "[{\"id\":\"
> contacts = JSON.parse(response.body)
=> [{"id"=>"
> contacts[0]["company_name"]
=> "..."
```

---

## Importing contacts

---

The power of the API, is how we can automate things:

1. Read contact details from a CSV file
2. Iterate over all contacts and create a new contact in Moneybird

---

Read contact details from CSV:

```
> require 'CSV'
=> true
> csv_contacts = CSV.read('create_contact/contacts.csv')
=> [["Moneybird B.V.", "support@moneybird.com", "Enschede"], ["Test bedrijf", "test@foobar.com", "Amsterdam"]]
```

---

Iterate over the contacts we just read:

```
> csv_contacts.map do |contact|;
>   contact[0];
> end
=> ["Moneybird B.V.", "Test bedrijf"]
```

---

Find in the API developer documentation the endpoint to create a contact.

---

https://developer.moneybird.com/api/contacts/#post_contacts

- We need to do a `POST` request
- We need to supply a `contact` parameter
- We can add extra parameters to this contact based on the information we want to add to the new contact

---

```
> responses = csv_contacts.map do |contact|;
>   RestClient.post(@api_url + 'contacts.json', { contact: { company_name: contact[0], send_invoices_to_email: contact[1], city: contact[2] } }, authorization: "Bearer #{@token}");
> end
=> [<RestClient::Response 201 "{\"id\":\"1998...">, <RestClient::Response 201 "{\"id\":\"1998...">]
```

---

## Importing invoices

---

Find the endpoint for creating a sales invoice

---

https://developer.moneybird.com/api/sales_invoices/#post_sales_invoices

- `POST` request
- We need to provide a `sales_invoice` parameter
- We want to provide a `contact_id` and `details_attributes`

---
