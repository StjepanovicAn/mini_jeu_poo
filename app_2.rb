require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry
puts " "
puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
puts "WELCOME TO BOB CONTRE LES PIRATE DE L'ESPACE 2"
puts "      Mais cette fois, Bob, c'est vous!"
puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

puts " "
puts "personnalise ton Bob en lui donnant un surnom stylé"
puts "genre 'le terrible' ou 'l'audacieu' ou même 'Gaudé'"
print ">"
user_name = gets.chomp

player1 = HumanPlayer.new(user_name)

bot1 = Player.new("roger le pirate de l'espace")
bot2 = Player.new("christopher, un autre pirate,")

Ennemies = [bot1, bot2]

while player1.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
	
	puts " "
	player1.show_state
	gets.chomp
	puts " "
	puts "que faisons nous bob #{user_name}?"
	puts "a - trouver un meilleur gourdin"
	puts "b - chercher un medipack"
	puts " "
	puts "attaquer un pirates"
	puts " "
	puts "0 > roger "
	puts "#{bot1.show_state} "
	puts " "
	puts "1 > christopher "
	puts "#{bot2.show_state} "
	print ">"
	user_choice = gets.chomp

	if user_choice == "a"
		player1.search_weapon
		puts " "
		puts "on y va?"
		gets.chomp
	elsif user_choice == "b"
		player1.search_health_pack
		puts "on y va?"
		gets.chomp
	elsif user_choice == "0"
		puts "go bob!"
		gets.chomp
		puts " "
		player1.attacks(bot1)
		puts " "
		gets.chomp
	elsif user_choice == "1"
		puts " "
		puts "go bob!"
		gets.chomp
		puts " "
		player1.attacks(bot2)
		puts " "
		gets.chomp
	end

	puts " "
	puts "Attention bob #{user_name}! Ils attaquent!"
	gets.chomp
	puts " "
	Ennemies.each do |pirate|
		pirate.attacks(player1)
			if pirate.life_points <= 0
				break
			end
			gets.chomp
		end

end

puts "the fight is over bob #{user_name}..."
if player1.life_points > 0
	puts " "
	puts "AND YOU WON!"
	puts "je savais que ces pirates de l'espace n'avaient aucune chance!"
	puts " "
else
	puts " gros t'es seh?"
	
end