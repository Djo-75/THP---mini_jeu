require 'pry'

class Player

    attr_accessor :name, :life_points

    def initialize(name)    # ok

        @name = name
        @life_points = 10

    end


    def show_state  # ok

        puts "#{@name} a #{@life_points} points de vie"

    end

    def gets_damage(damage_value) # ok

        @life_points = @life_points - damage_value

        if @life_points <= 0
        puts "Le joueur #{@name} a été tué"
        end
    end

    def attacks(other_player) # ok, le ".name" permet d'attribuer les caractéristiques de @name à other_player

        other_player.name # quand on appelle un argument, toujours le rappeler dans la méthode
        puts "#{@name} attaque #{other_player.name}"

        other_player.compute_damage

        puts "Il/elle lui inflige #{other_player.compute_damage} dégâts"    # ça marche
        puts

        other_player.gets_damage(other_player.compute_damage) # je stocke ici 
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)    # ok
        @name = name
        @weapon_level = 1
        @life_points = 100

    end    

    def compute_damage # ok

        rand(1..6) * @weapon_level
    
    end


    def search_weapon # ok, Je trouve une arme et détermine si je la garde ou non

        new_weapon = rand(1..6)  

        puts "Tu as trouvé une arme de niveau #{new_weapon}"

        if new_weapon > weapon_level
            @weapon_level = new_weapon
            puts "Merveilleux, t'as une arme plus puissante !"
        else
            puts "Diantre, ton arme est moins puissante !"
        end
    end

    def search_health_pack

        health_pack = rand(1..6)        

        if health_pack == 1
            puts "Tu n'as rien trouvé"
        end

        if health_pack >= 2 && health_pack <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points = @life_points + 50
                if @life_points > 100
                    @life_points = 100
                end
        end

        if health_pack == 6
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points = @life_points + 80
            if @life_points > 100
                @life_points = 100
            end
        end
    end
end


