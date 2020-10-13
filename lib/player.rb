class Player

	attr_accessor :name
	attr_accessor :life_points

	def initialize (player_name)
		@name = player_name
		@life_points = 25
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(damage_point)
		@life_points = @life_points - damage_point
		if life_points <= 0
			puts "#{@name.upcase} GOES DOOOOOWN!!!!!"
		end
	end

	def attacks(victime)
		puts "#{@name} attaque #{victime.name} " 
		attack_damage = compute_damage
		if attack_damage <=3
			puts "attaque pourrie! Seulement #{attack_damage} DP!"
		else 
			puts "houlala ça fait mal! #{attack_damage} points de dégat!"
		end	
		return victime.gets_damage(attack_damage)
	end


	def compute_damage
		rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(player_name)
		@name = player_name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "bob #{@name} a #{@life_points} points de vie et un gros gourdin de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
		
	end

	def search_weapon
		new_weapon_level = rand(1..6)
		puts "WOW tu as trouvé un gourdin de niveau #{new_weapon_level}!"
		if new_weapon_level > @weapon_level
			@weapon_level = new_weapon_level
			puts "Tu vas casser du pirate de l'espace avec ça!"
		else
			puts "C'est de la merde, laisse ça là "
		end
	end

	def search_health_pack
		luck = rand(1..6)
		if luck == 1
			puts "il n'y a rien ici"
		elsif luck <= 5 && luck >= 2
			@life_points = @life_points + 50
			puts "WOA + 50 PV!"
		elsif luck > 5
			@life_points = @life_points + 80 
			puts "+ 80 PV? JE SENS LA PUISSAAAAAAANCE"
		end

		if @life_points > 100
			@life_points = @life_points - (@life_points-100)
			puts "santée max!"
		end
	end

end