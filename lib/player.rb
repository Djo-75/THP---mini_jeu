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

        other_player.gets_damage(other_player.compute_damage) # je stocke ici 
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)    # ok

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

binding.pry


end






# Elle commence également par lancer un "dé" dont le résultat sera compris entre 1 et 6. En fonction du résultat, voilà ce qu'elle devra faire :

# Si le résultat est égal à 1, le joueur n'a rien trouvé et on retourne simplement le string "Tu n'as rien trouvé... ".

# joueur a trouvé un pack de 50 points de vie. On va donc augmenter sa vie de 50 points mais sans qu'elle puisse dépasser 100 points

# Si le résultat est égal à 6, le joueur a trouvé un pack de 80 points de vie. On va donc augmenter sa vie de 80 points mais sans qu'elle puisse dépasser 100 points. Puis on va retourner le string "Waow, tu as trouvé un pack de +80 points de vie !".
# 


# Exo 1.0

# player1 = Player.new("Josiane")
# player2 = Player.new("José")

# puts "À ma droite #{player1.name}"
# puts "À ma gauche #{player2.name}"
# puts




# while player1.life_points > 0 && player2.life_points > 0
    
#     puts "Voici l'état de chaque joueur"
#     puts
#     puts "#{player1.show_state}"
#     puts
#     puts "#{player2.show_state}"
#     puts
#     puts "Passons à la phase d'attaque :"
#     puts
#         player1.attacks(player2)
#         if player2.life_points <= 0
#             break
#         end
#     puts   
#         player2.attacks(player1)
#     puts 
# end


# player1 = Player.new("José")