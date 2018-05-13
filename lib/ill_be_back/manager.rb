module IllBeBack
  class Manager

    def prepare!
      @armed = true
    end

    def armed?
      !!@armed
    end

    def debug(&block)
      return unless armed?
      block.call
      @armed = false
    end

  end
end
