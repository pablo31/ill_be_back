require 'binding_of_caller'
require 'pry-byebug'

require 'ill_be_back/version'
require 'ill_be_back/configuration'
require 'ill_be_back/manager'
require 'ill_be_back/debuggers/pry'

module IllBeBack
  class << self

    # core methods

    def prepare!
      manager.prepare!
    end

    def debug
      b = binding.of_caller(3)
      manager.debug(b)
    end

    def configure
      yield(configuration)
    end

    # helper methods

    def configuration
      Configuration.instance
    end

    def debugger
      configuration.debugger || Debuggers::Pry.new
    end

    def manager
      @manager ||= Manager.new(debugger)
    end

  end
end
