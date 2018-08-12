module IllBeBack
  module DebugStrategies
    class NTimes

      def self.from_enumerator(enumerator)
        count = 0
        enumerator.each { count += 1 }
        new(count)
      end

      def initialize(count)
        @count = count
      end

      def call(stops, block)
        block.call unless stops > @count
      end

    end
  end
end
