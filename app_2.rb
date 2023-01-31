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

# puts "Quel est ton prénom ?"
# print ">" 
# puts gets.chomp

user = HumanPlayer.new("Jordan")

player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemis = [player1, player2]


while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)

    puts
    puts "TON STATUT"
    puts
    
    user.show_state
    puts

    puts "STATUT ENNEMIS"
    puts

    puts "Voici les points de vie de tes ennemmis"
    puts
    player1.show_state
    player2.show_state
    if player1.life_points <= 0 || player2.life_points <= 0
        puts "L'un des ennemis n'a plus de vie"
        break
    end

    puts
    puts "-- TOUR DU USER -- "
    puts

   puts "Quelle action souhaites-tu effectuer ?"
   puts
   puts "Les actions suivantes sont possibles"
   puts
   puts "Tape a pour chercher une meilleure arme"
   puts "Tape s pour chercher de la vie"
   puts "Tape 0 pour attaquer #{player1.name}"
   puts "Tape 1 pour attaquer #{player2.name}"
   puts "> "
   action = gets.chomp
   puts

    if action == "a"
        user.search_weapon
    elsif action == "s"
        user.search_health_pack
    elsif action == "0"
        user.attacks(player1)
    elsif action == "1"
        user.attacks(player2)
    end

    puts
    puts "-- TOUR DES ENNEMIS -- "
    puts
    puts "Les autres joueurs t'attaquent !"
    puts
    ennemis.each do |bots|
        if player1.life_points > 0 || player2.life_points > 0
            bots.attacks(user) 
        else player1.life_points <= 0 || player2.life_points <= 0
            break
        end
    end
end

    if user.life_points <= 0
        puts
        user.show_state
        puts
        puts "Loser ! Tu as perdu !"
        puts
        puts "-- FIN DU JEU --"
    else
        puts
        player1.show_state
        player2.show_state
        puts
        puts "Bravo ! Tu as gagné !"
        puts
        puts "-- FIN DU JEU --"
    end