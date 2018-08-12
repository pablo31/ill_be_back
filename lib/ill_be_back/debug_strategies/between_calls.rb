module IllBeBack
  module DebugStrategies
    class BetweenCalls

      def initialize(start_call_number, end_call_number)
        @start_call_number = start_call_number
        @end_call_number = end_call_number
      end

      def call(stops, block)
        block.call if stops >= @start_call_number && stops <= @end_call_number
      end

    end
  end
end
