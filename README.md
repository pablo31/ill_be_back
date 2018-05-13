# IllBeBack

A line of code runs a million times but it has some kind of trouble in determinated conditions not given (or accessible) by the object who owns this line of code.
I want to say when to stop and debug, from outside.
Thats what IllBeBack does.

## Installation

    gem 'ill_be_back'

## Usage

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
