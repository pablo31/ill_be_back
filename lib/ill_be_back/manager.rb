module IllBeBack
  class Manager

    attr_accessor :debugger

    def initialize(debugger)
      self.debugger = debugger
    end

    def prepare!
      @armed = true
    end

    def armed?
      !!@armed
    end

    def debug
      return unless armed?
      debugger.call(self)
    end

  end
end
