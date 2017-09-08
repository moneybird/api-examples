This repository contains examples for using the Moneybird API.

## Requirements

1. An up to date Ruby installation. To download Ruby on your computer, visit [ruby-lang.org](https://www.ruby-lang.org/en/downloads/) for more information.
2. To check out the source code in this git repository, you need the `git` command or a git client like the [Github Desktop app](https://desktop.github.com/).
3. Check out this repository in a local folder in your computer.
4. All files can be executed using `ruby`, therefore you need a command line like Terminal for Mac or Command Prompt for Windows. All following commands should be executed in the command line.
5. Install the `bundler` gem to manage dependencies: `gem install bundler`
6. In order to make requesting the servers easier, we use a high level HTTP library for Ruby called [rest-client](https://github.com/rest-client/rest-client). To install this dependency, execute `bundle install`.

## Running the examples

First, you need to set a authentication token and administration id. Copy `config_example.rb` to `config.rb` and change the values in the file.

Each example in the subfolders can be run independently, for example:

```
bundle exec authentication/test_authentication.rb
```

## The workshop

Sheets from the workshop about using the API can be found in PITCHME.md and on Gitpitch.com:

[![GitPitch](https://gitpitch.com/assets/badge.svg)](https://gitpitch.com/moneybird/api-examples/master?grs=github&t=white)
