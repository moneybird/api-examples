This repository contains examples for using the Moneybird API.

## Requirements

1. An up to date Ruby installation. To download Ruby on your computer, visit [ruby-lang.org](https://www.ruby-lang.org/en/downloads/) for more information.
2. All files can be executed using `ruby`, therefore you need a command line like Terminal for Mac or Command Prompt for Windows.
3. Install the `bundler` gem to manage dependencies: `gem install bundler`
4. In order to make requesting the servers easier, we use a high level HTTP library for Ruby called [rest-client](https://github.com/rest-client/rest-client). To install this dependency, execute `bundle install`.

## Running the examples

First, you need to set a authentication token and administration id. Copy `config_example.rb` to `config.rb` and change the values in the file. 

Each example in the subfolders can be run independently, for example:

```
bundle exec authentication/test_authentication.rb
```
