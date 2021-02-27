require_relative './lib/game'

puts File.read('./lib/banner.txt')
tic_tac_toe = Game.new

tic_tac_toe.start
