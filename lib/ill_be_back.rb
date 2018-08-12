require 'forwardable'

require 'ill_be_back/version'
require 'ill_be_back/manager'
require 'ill_be_back/debug_strategies/n_times'
require 'ill_be_back/debug_strategies/at_call'
require 'ill_be_back/debug_strategies/between_calls'

module IllBeBack
  class << self
    extend Forwardable

    def_delegators :manager, :prepare!, :armed?,
    :debug, :debug_at_call, :debug_within_calls

    def manager
      @manager ||= Manager.new
    end

  end
end
