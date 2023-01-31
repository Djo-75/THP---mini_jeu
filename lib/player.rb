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

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "À ma droite #{player1.name}"
puts "À ma gauche #{player2.name}"
puts


while player1.life_points > 0 && player2.life_points > 0
    
    puts "Voici l'état de chaque joueur"
    puts
    puts "#{player1.show_state}"
    puts
    puts "#{player2.show_state}"
    puts
    puts "Passons à la phase d'attaque :"
    puts
        player1.attacks(player2)
        if player2.life_points <= 0
            break
        end
    puts   
        player2.attacks(player1)
    puts 
end


# player1 = Player.new("José")