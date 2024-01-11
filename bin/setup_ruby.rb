#!/bin/ruby

require 'bunlder/inline'

def has_command?(cmd)
  !`which #{cmd}`.include?('not found')
end

system 'clear'

# TODO: Make this an ARGSV
# puts 'Updating System...'
# system 'sudo pacman -Syu --no-confirm'
# puts 'System Updated.'

puts 'Loading Gems...'

unless has_command?('rbenv')
  puts 'Please install rbenv and ruby-build and install ruby before running this script'
  exit 1
end

gemfile do
  gem 'solargraph'
  gem 'ripper-tags'
  gem 'gem-ctags'
  gem 'gem-browse'

  # Guard + plugins
  gem 'guard'
  gem 'guard-bundler'         # Auto install/update gem bundle when needed
  gem 'guard-rspec'           # Autotest for rspec
  gem 'guard-yard'            # Auto monitor and generate yard docs
  gem 'guard-ctags-bundler'   # Auto generate gem tags through bundler
  # gem 'guard-rdoc'
  # gem 'guard-foreman'
  # gem 'guard-brakeman'      # Auto scan app with brakeman
end
puts 'Gems Loaded'

puts 'Rehashing...'
system 'rbenv rehash'

# Install rbenv ctags plugin if needed
puts 'Checking if we have the rbenv-ctags plugin...'
unless Dir.exist?('~/.rbenv/plugins/rbenv-ctags')
  puts 'Installing rbenv ctags plugin...'
  system 'git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags'
end

# Install uninversal-ctags if needed then generate gem tags
system 'sudo yay -S universal-ctags-git --noconfirm' unless has_command?('ctags')

system 'gem ctags'
system 'rbenv ctags'

# Install yarn if needed and then generate documentation for gems
system 'sudo pacman -S yarn --no-confirm' unless has_command?('yarn')

puts 'Loading yard documentation for gems...'
system 'yard gems'
system 'yard config --gem-install-yri'

system 'ripper-tags -R --exclude=vendor'
