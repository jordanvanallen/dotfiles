# frozen_string_literal: true

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

Pry::Commands.delete 'c'
Pry::Commands.delete 's'
Pry::Commands.delete 'n'
Pry::Commands.delete 'f'

# Hit enter to repeat last command
Pry::Commands.command(/^$/, 'repeat last command') do
  pry_instance.run_command Pry.history.to_a.last
end
