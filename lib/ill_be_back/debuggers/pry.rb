module IllBeBack
  module Debuggers
    class Pry

      def call(b)
        b2 = binding.of_caller(5)
        binding.pry
        ::Pry.start_with_pry_byebug(b2)
      end

    end
  end
end
