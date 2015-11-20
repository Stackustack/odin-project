class Dnd

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def start(location)
		@player.location = location
	end

	def add_room(room_code,room_name,description,connections)
		@rooms << Room.new(room_code,room_name,description,connections)
	end

	def show_current_location
		puts find_room(@player.location).full_desciption
	end

	def find_room(room_to_find)
		@rooms.detect {|x| x.room_code == room_to_find}
	end

	def find_room_in_direction(direction)
		find_room(@player.location).connections[direction]
	end

	def go(direction)
		puts "You go #{direction}"
		@player.location = find_room_in_direction(direction)
		show_current_location
	end


	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end

	class Room
		attr_accessor :room_code, :room_name, :description, :connections

		def initialize(room_code,room_name,description,connections)
			@room_code = room_code
			@room_name = room_name
			@description = description
			@connections = connections
		end

		def full_desciption
			puts "You're in #{room_name}."
			puts "Info: #{@description}"
		end
	end
end

new_game = Dnd.new("John")
new_game.add_room(:small_cave,"Small Cave", "Dark and wet small cave ", {:east => :big_cave})
new_game.add_room(:big_cave,"Big Cave", "Bright big cave ", {:west => :small_cave})
new_game.start(:small_cave)
new_game.show_current_location

new_game.go(:east)
new_game.go(:west)


