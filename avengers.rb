require 'date'

## Part 1: Database
require_relative './lib/avenger.rb'

ironman = Avenger.new
ironman.name = "Tony Stark"
ironman.superhero = "Ironman"
ironman.powers = ["Smart", "Rich"]
ironman.birthday = "29-05-1970"

## Part 4: Executing our program.
require_relative './lib/cli.rb'
CLI.new.main
