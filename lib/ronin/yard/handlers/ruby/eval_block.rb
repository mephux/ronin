require 'yard/handlers/ruby/base'

module YARD
  module Handlers
    module Ruby
      class EvalBlock < YARD::Handlers::Ruby::Base

        handles method_call(:module_eval), method_call(:class_eval), method_call(:instance_eval)

        def process
          parse_block(statement.last)
        end
      end
    end
  end
end