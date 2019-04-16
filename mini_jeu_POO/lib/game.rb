
require "pry"

class Game
  attr_accessor :humanplayer, :ennemies

# Define enemies and the playable character of the USer
  def initialize (humanplayer)
    @humanplayer = HumanPlayer.new("#{humanplayer}",100,1)
    @player_1 = Player.new("Niama Guerrier de Feu", 10)
    @player_2 = Player.new("Niama Archer de Glace", 10)
    @player_3 = Player.new("Niama Maître de la Terre", 10)
    @player_4 = Player.new("Niama Moche et Méchant", 10)
    @ennemies = [@player_1, @player_2, @player_3, @player_4]
  end

  def kill_player
    @ennemies.each {
     |player|
    if (player.life_points <= 0)
      @ennemies.delete(player)
      puts "#{player.name} est mort."
    end
    }
  end

  def is_still_ongoing?
    if @humanplayer.life_points > 0 && (@player_1.life_points > 0 || @player_2.life_points > 0 || @player_3.life_points > 0 || @player_4.life_points > 0)
      return true
    else
      return false
    end
  end

# Displays User status (HP + weapon lvl) + amount of remaining enemies on field
  def show_players
    puts
    @humanplayer.show_state
    puts "2) #{@ennemies.size} combattent encore."
    puts
  end

# Displays selection menu
  def menu
    command = 1
    puts "Que voulez-vous faire?"
    puts "a - Je veux chercher une meilleure arme!"
    puts "s - J'ai besoin de me soigner!"
    puts
    puts "Attaquer un ennemi à portée:"
    @ennemies.each {
    |player| puts "#{command} - #{player.name} a #{player.life_points} points de vie."
    command += 1
     }

  end

# Defines all User possible choices in-between rounds
  def menu_choice(action)
    if action == "a"
      @humanplayer.search_weapon
        elsif action == "s"
      @humanplayer.search_health_pack
        elsif action == "1"
      @humanplayer.attack(@player_1)
        elsif action == "2"
      @humanplayer.attack(@player_2)
        elsif action == "3"
      @humanplayer.attack(@player_3)
        elsif action == "4"
      @humanplayer.attack(@player_4)
    else puts "Choisir a, s, 1, 2, 3 ou 4"
    end

      kill_player
  end

  def enemies_attack
    puts "Les Niamas fous attaquent!!"
      @ennemies.each {
      |player| player.attack(@humanplayer)
        }
  end

# Game over screen
  def end
    if humanplayer.life_points > 0
      puts "Incroyable! Tu es un Champion Niama!"
    elsif humanplayer.life_points < 0
      puts "Meurs en enfer, sous-être!"
    end
  puts
  puts "Too bad."
  puts
  end
end
