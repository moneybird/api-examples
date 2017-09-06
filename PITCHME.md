---

Workshop: how to create an API connection with Moneybird

---

Goal of this workshop:

1. Authentication: making the first request
2. Creating a contact by parsing a CSV file
3. Creating a sales invoice by parsing a CSV file

---

Before we start:

- Make sure you have ruby installed: `ruby -v`
- Make sure you have git installed: `git -v`
- Check out the Github project: `git checkout git@github.com:moneybird/api-examples.git`
- Make sure you have bundler installed: `gem install bundler`
- Execute `bundle install` to install all dependencies

---

Start a Ruby console to start live coding:

```
$ pry
```

---

First, we need to require `rest-client`. This Ruby library makes requesting REST API's easier.

```
> require 'rest-client'
=> true
```

---
