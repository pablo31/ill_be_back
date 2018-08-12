# IllBeBack

A line of code runs a million times but it has some kind of trouble in determinated conditions not given (or accessible) by the object who owns this line of code.
I want to say when to stop and debug, from outside.
Thats what IllBeBack does.

## Installation

    gem 'ill_be_back'

## Basic usage

    require 'pry'
    require 'ill_be_back'

    class Model

      def magic
        IllBeBack.debug { binding.pry }
        puts "Something"
      end

    end

    model = Model.new

    model.magic # prints something
    model.magic # prints something, again

    IllBeBack.prepare!

    model.magic # stops in pry, and then prints something
    model.magic # back to normallity: prints something

## Advanced usage

        IllBeBack.debug { binding.pry } # stops once after 'prepare!' call
        IllBeBack.debug(2.times) { binding.pry } # stops twice after 'prepare!' call
        IllBeBack.debug_at_call(4) { binding.pry } # stops at 4th call after 'prepare!' call
        IllBeBack.debug_between_calls(2, 4) { binding.pry } # stops at calls 2, 3 and 4 after 'prepare!' call
        IllBeBack.armed? # true if 'prepare!' was called
