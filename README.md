[![Gem Version](https://img.shields.io/gem/v/capistrano-dotenv.svg)](https://rubygems.org/gems/capistrano-dotenv)
[![Dependencies](https://img.shields.io/gemnasium/jplethier/capistrano-dotenv.svg)](https://gemnasium.com/jplethier/capistrano-dotenv)
[![Code Climate](https://img.shields.io/codeclimate/github/jplethier/capistrano-dotenv.svg)](https://codeclimate.com/github/jplethier/capistrano-dotenv)


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

Require in `Capfile`:

```ruby
require 'capistrano/dotenv'
```

To check and ensure that deploy contains invoke both `dotenv:read` and `dotenv:check` tasks before to invoke `dotenv:setup`

```ruby
invoke 'dotenv:read'
invoke 'dotenv:check'
invoke 'dotenv:setup'
```

If you do not want to check, invoke only `dotenv:read` and `dotenv:setup` to just read and upload the env vars

```ruby
invoke 'dotenv:read'
invoke 'dotenv:setup'
```

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

If you use [dotgpg](https://github.com/ConradIrwin/dotgpg) to secure your env vars on git, just set the env_file passing the gpg file, and it will ask your gpg password and read it from gpg file correctly. For example:

```ruby
set :env_file, ".env_#{stage}.gpg"
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

### Roles

By default, the setup task will upload generated .env file to all roles(:all), but you can define what roles to run this

```ruby
set :dotenv_roles, :app
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jplethier/capistrano-dotenv.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
