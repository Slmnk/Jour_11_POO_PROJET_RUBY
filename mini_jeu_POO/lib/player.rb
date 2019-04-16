require 'pry'

    class Player

      attr_accessor :name, :life_points

      def initialize(name)
        @name = name
        @life_points = 10
      end

      def show_state
        puts "#{@name} a #{@life_points} points de vie."
      end

      def gets_damage(damage_received)
        @life_points = [@life_points - damage_received, 0].max
        if @life_points <= 0
          puts "#{name} a été tué."
        end
      end

      def attacks(player_to_attack)
        puts "Le joueur #{self.name} attaque le joueur #{player_to_attack.name}."

        def compute_damage
          return rand(1..6)
        end

        @damage_given = compute_damage
        puts "Inflige #{@damage_given} dégât(s)."
        player_to_attack.gets_damage(@damage_given)
      end
    end

    class HumanPlayer < Player

        attr_accessor :weapon_level, :life_points

        def initialize(name)
          super(name)
          @life_points = 100
          @weapon_level = 1
        end

        def show_state
          puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
        end

        def compute_damage
          rand(1..6) * @weapon_level
        end

        def search_weapon
          @new_weapon_level = rand(1..6)
          puts "Tu as trouvé une arme de niveau #{@new_weapon_level}!"

            if  @new_weapon_level > @weapon_level
                @weapon_level = @new_weapon_level
                puts "Youhou, l'arme que tu as trouvé est plus puissante que celle que tu possédais! Tu l'équipes..."
            elsif @weapon_level > @new_weapon_level || @weapon_level = @new_weapon_level
               puts "Mais elle ne vaut pas le coup, malheureusement."
            end

        end

        def search_healthpack

          roll_for_healthpack = rand(1..6)
          if roll_for_healthpack == 1
            puts "Tu n'as rien trouvé..."
          elsif roll_for_healthpack == 2 || 3 || 4 || 5
             @life_points += 50
            puts "Tu as trouvé un pack de santé! + 50 points de vie!"
          elsif roll_for_healthpack == 6
             @life_points += 80
            puts "Tu as trouvé un SUPER pack de santé ! + 80 points de vie!" # pourquoi après avoir crée mon humanplayer1 en faisant humanplayer1.search_healthpack il ne trouve JAMAIS de superpack ???


          end

          if @life_points > 100
            @life_points = 100
          end
        end

    end
