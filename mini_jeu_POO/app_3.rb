require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Welcome screen
puts " -------------------------- "
puts "|  SUPER SMASH BR-OOP       |"
puts "|  MELEE ULTIMATE 64        |"
puts " -------------------------- "

# Initializing User player character
puts 'Please enter your name to begin'
puts name_player = gets.chomp
my_game = Game.new(name_player)

while my_game.is_still_ongoing? == true do

  my_game.show_players
  my_game.menu
  puts "select your action choice"
  action = gets.chomp.to_s
  puts
  my_game.menu_choice(action)
  my_game.enemies_attack
end

my_game.end
