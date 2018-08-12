module IllBeBack
  class Manager

    def initialize
      @armed = false
    end

    def prepare!
      @stops = 0
      @armed = true
    end

    def armed?
      @armed
    end

    def debug(n_times_enumerator = nil, &block)
      strategy = DebugStrategies::NTimes.from_enumerator(n_times_enumerator || 1.times)
      handle_call_with(strategy, block)
    end

    def debug_at_call(call_number, &block)
      strategy = DebugStrategies::AtCall.new(call_number)
      handle_call_with(strategy, block)
    end

    def debug_between_calls(start_call_number, end_call_number, &block)
      strategy = DebugStrategies::BetweenCalls.new(start_call_number, end_call_number)
      handle_call_with(strategy, block)
    end

    protected

    def handle_call_with(strategy, block)
      return unless armed?
      @stops += 1
      strategy.call(@stops, block)
    end

  end
end
