require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Welcome screen
puts "------------------------------------------------
      |Bienvenue sur 'Le Survivant des Niamas 3' !      |
      |Le but du jeu est d'être le dernier niama en vie.|
      -------------------------------------------------"

# Initializing User player character
puts 'Entrez votre nom pour commencer'
puts name_player = gets.chomp
my_game = Game.new(name_player)

while my_game.is_still_ongoing? == true do

  my_game.show_players
  my_game.menu
  puts "Choisir une action"
  action = gets.chomp.to_s
  puts
  my_game.menu_choice(action)
  my_game.enemies_attack
end

my_game.end
