# Payment-ruby test app

* Ruby 3.0.5
* Rails 6

To install app

```
git clone git@github.com:olegsobchuk/payments-ruby.git
cd payments-ruby
bundle
rake db:create db:migrate
```

To run tests

```
rails db:migrate RAILS_ENV=test
rspec spec
```

to import merchants

```
rake merchants:import_csv['/full/path/to/file.csv']
```
take into account, merchant file should have header with names `name,description,email,status`
each record goes through validation, so be ready that not all records will make it.


[DOCKER INFO](doc/DOCKER.md)
