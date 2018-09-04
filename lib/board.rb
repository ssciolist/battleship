require_relative 'ship.rb'
require_relative 'shot.rb'

class Board
	attr_reader :ships

	def initialize
		@layout  =   ["a1", "a2", "a3", "a4",
                  "b1", "b2", "b3", "b4",
                  "c1", "c2", "c3", "c4",
                  "d1", "d2", "d3", "d4"]
    @value   =   {"a" => 1, "b" => 2, "c" => 3, "d" => 4}
		@ships   =   []
	end

  def print_board
    puts "==========="
    puts ".  1 2 3 4"
    puts "A"
    puts "B"
    puts "C"
    puts "D"
    puts "==========="
  end

  def add_midsection(array)
    bow = array[0]
    stern = array[1]
    if bow[0] == stern[0]
      midsection = "#{bow[0]}" + "#{(bow[1].to_i - stern[1].to_i).abs}"
    else
      to_add = "#{@value.key((@value[bow[0]] - @value[stern[0]]).abs)}"
      midsection = to_add + "#{bow[1]}"
    end
    array << midsection
    array
  end

  def place_player_ship(type, size)
    placed = false
    while placed == false
      puts "The grid has A1 at the top left and D4 at the bottom right."
      puts "Enter the squares for the #{type} #{size}-unit ship:"
      coordinates = gets.chomp.downcase
      position = [coordinates[0] + coordinates[1],coordinates[3] + coordinates[4]]

      if @layout.include?("#{position[0]}") == false || @layout.include?("#{position[1]}") == false
        puts "Bad input or coordinate is off the board."

      elsif position[0][0] != position[1][0] && position[0][1].to_i != position[1][1].to_i
        puts "Ships can be laid either horizontally or vertically"

      elsif (@value[position[0][0]] - @value[position[1][0]]).abs != (size - 1) && (position[0][1].to_i - position[1][1].to_i).abs != (size - 1)
        puts "Coordinates must correspond to the first and last units of the ship."

      elsif @ships.include?("#{position[0]}") == true || @ships.include?("#{position[1]}") == true
        puts "Ships cannot overlap"

      else
        if size > 2
          position = add_midsection(position)
        end
        @ships << Ship.new(type, position)
        puts "#{type} placed at #{position[0]}, #{position[1]}"
        placed = true
      end
    end
  end
end
