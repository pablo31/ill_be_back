module IllBeBack
  module DebugStrategies
    class AtCall

      def initialize(call_number)
        @call_number = call_number
      end

      def call(stops, block)
        block.call if stops == @call_number
      end

    end
  end
end
