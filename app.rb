require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry
player1 = Player.new("bob")
player2 = Player.new("le pirate de l'espace")

puts " "
puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
puts "WELCOME TO BOB CONTRE LES PIRATE DE L'ESPACE"
puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"


 while player1.life_points >= 0 && player2.life_points >= 0 

	puts " "
	puts "Voici l'état de nos combattants!"
	player1.show_state
	player2.show_state
	
	puts " "
	puts "HAJIME!"
	player2.attacks(player1)
	if player1.life_points <= 0
		break
	end
	player1.attacks(player2)
	
end

if player1.life_points <= 0
	puts " "
	puts "BOB IS DEAD"
	puts "###########"
	puts "TRY AGAIN"

elsif player2.life_points <= 0
	puts " "
	puts "YEAH BOB A VAINCU LES PIRATES"
end
	