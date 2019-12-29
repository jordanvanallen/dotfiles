# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# guard 'bundler' do
#   watch('Gemfile')
# end

rspec_options = {
  cmd: 'bundle exec rspec --color',
  failed_mode: :focus,
  spec_paths: ['spec']
}

guard 'rspec', rspec_options do
  watch(%r{/^spec\/.+_spec\.rb/})
  watch(%r{/^app\/.+\.rb/})                          { |m| 'spec/concepts' }
  watch(%r{/^app\/.+\/.+\.rb/})                      { |m| 'spec/concepts' }
  watch(%r{/^lib\/.+\.rb/})                          { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')                       { 'spec' }
  watch('config/routes.rb')                          { 'spec/concepts' }
  watch('app/controllers/application_controller.rb') { 'spec/controllers' }
  watch(%r{^lib/(.+)\.rb$})                          { |m| ['spec/concepts', "spec/lib/#{m[1]}_spec.rb"] }
  watch('spec/factories.rb')                         { ['spec/concepts', 'spec/models'] }
end


ctags_bundler_options = {
  binary: '~/bin/rtags',
  arguments: '-R --exclude=vendor',
  bundler_tags_file: 'tags'
}

guard 'ctags-bundler', ctags_bundler_options do
  watch(%r{/^(app|lib|spec)\/.*\.rb$/})
  watch('Gemfile.lock')
end

yard_options = {
  server: true,
  port: 8808,
  host: 'localhost'
}

guard 'yard', yard_options do
  watch('Gemfile.lock')
end
