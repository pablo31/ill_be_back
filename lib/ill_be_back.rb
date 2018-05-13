require 'ill_be_back/version'
require 'ill_be_back/manager'

module IllBeBack
  class << self

    def manager
      @manager ||= Manager.new
    end

    # core methods

    def prepare!
      manager.prepare!
    end

    def armed?
      manager.armed?
    end

    def debug(&block)
      manager.debug(&block)
    end

  end
end
