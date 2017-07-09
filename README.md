[![Gem Version](https://img.shields.io/gem/v/capistrano-dotenv.svg)](https://rubygems.org/gems/capistrano-dotenv)
[![Dependencies](https://img.shields.io/gemnasium/ydkn/capistrano-dotenv.svg)](https://gemnasium.com/ydkn/capistrano-dotenv)
[![Code Climate](https://img.shields.io/codeclimate/github/ydkn/capistrano-dotenv.svg)](https://codeclimate.com/github/ydkn/capistrano-dotenv)


# Capistrano::Dotenv

Capitranos tasks to setup and check env vars using dotenv

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-dotenv', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-dotenv


## Usage

You should ensure there is a `rails` binstub in the `current/bin` directory on the server otherwise
this gem won't work (because rails itself won't work).
If you experience any problems please verify that manually running `rails console` on the server does work.
If it doesn't you are deploying your rails application wrong (check [#18](https://github.com/ydkn/capistrano-rails-console/issues/18) or [#26](https://github.com/ydkn/capistrano-rails-console/issues/26) for details)!

Require in `Capfile`:

```ruby
require 'capistrano/dotenv'
```

TODO: adds examples how to use

## Options

### Env file

Use differents env files for each environment

```ruby
set :env_file, ".env_#{stage}"
```

Or use the same file for every environment(default)

```ruby
set :env_file, '.env'
```

### Optional env vars

There are env vars that you want to set only in some enviroments or you will use a default value if it is not defined, so it is not required to be set a value for them. To be able to run check without fail the deployment if those env vars do not have a value set, just set it as optional

```ruby
set :optional_env_vars, %w(OPTIONAL_VAR1 OPTIONAL_VAR2)
```

### Ignored env vars

There are project env vars needed only for test or development environment, so those vars need to be ignored when you are deploying the project

```ruby
set :ignored_env_vars, %w(IGNORED_VAR1 IGNORED_VAR2)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jplethier/capistrano-dotenv.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
