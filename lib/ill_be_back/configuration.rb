module IllBeBack
  class Configuration

    attr_accessor :debugger

    def self.instance
      @instance ||= new
    end

  end
end
