require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts puts

puts "------------------------------------------------"
puts "|         Bienvenue sur 'POO LOUP LOUP' !       |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts puts

puts "Quel est ton prénom ?"

puts gets.chomp

player1 = Player.new("gets.chomp")
puts player1