require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
      |Bienvenue sur 'Le Survivant des Niamas 2' !      |
      |Le but du jeu est d'être le dernier niama en vie.|
      -------------------------------------------------"

puts "WazZZZUuuPPP'' BROOouuhHHH,, WHATSSss URr NaaaMEEeeeeeE? "
print ">"
name_player = gets.chomp

#human player initialization
humanplayer = HumanPlayer.new("#{name_player}")

#bot player initialization
enemies = []
player_1 = Player.new("Josiane")    # est-il nécessaire de mettre le "enemies" en @enemies?
player_2 = Player.new("José")
enemies << player_1
enemies << player_2
puts ""
puts "Attention! Des Niamas Enragés apparaissent !"
puts ""
puts "Nous allons avoir l'honneur de voir combattre #{humanplayer.name} contre les Niamas Enragés, #{player_1.name} et #{player_2.name} !"
puts "Voici l'état de nos joueurs:"
humanplayer.show_state
enemies.each { |player| player.show_state}
puts ""


while humanplayer.life_points >0 && (player_1.life_points > 0 || player_2.life_points >0) do # tandis que moi j'avais fait: humanplayer.life_points > 0 || player_1.life_points > 0 && player_2.life_points > 0, même logique me semble mais ça marche pas. autant prendre celle du cours
  puts ""
  puts "Voici l'état de santé du joueur:"
  humanplayer.show_state
  puts ""
  puts "Quelle action veux-tu effectuer?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue:"
  puts ""
  puts "0 - #{player_1.show_state}"
  puts "1 - #{player_2.show_state}"

  action = gets.chomp

  if action == "a"
    humanplayer.search_weapon
  elsif action == "s"
    humanplayer.search_healthpack
  elsif action == "0"
    humanplayer.attacks(player_1)
  elsif action == "1"
    humanplayer.attacks(player_2)
  else puts "Veuillez choisir une action en appuyant sur a, s, 0 ou 1."
  end


  # petit problème: le message apparait bien à chaque tour,
  #tout est cohérent, sauf qu'au dernier tour, quand je gagne, il m'affiche que les ennemis attaquent alors que juste après ma ligne "bravo" s'affiche, car la boucle se finit
  #comment faire en sorte que cela n'apparaisse que lorsqu'une action est employée?
  puts ""
  puts "Les ennemis vous attaquent!"
  puts ""
  enemies.each { |player|
                if player.life_points > 0 && humanplayer.life_points > 0
                   player.attacks(humanplayer)
                end }

  # enemies.each {|player| if player.attacks?(humanplayer) == true
  #                          puts "#{player.name} vous attaque!"        voilà un code que j'ai essayé pour dire, à chaque player qui attaque, dit le nom du player + la string " vous attaque" sans succès, en m'inspirant du bloc de code précédent avec le each
  #                       end}                                          dit le nom du player + la string " vous attaque" sans succès, en m'inspirant du bloc de code précédent avec le each

end

puts ""
puts "La partie est finie!"

if humanplayer.life_points > 0
  puts "BRAVO! Tu es un valeureux Niama!"
elsif humanplayer.life_points = 0
  puts "Dommage! Tu ne mérites pas le statut de Niama."
end
