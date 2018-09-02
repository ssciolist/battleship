require_relative 'ship.rb'
require_relative 'shot.rb'

class Board
	attr_reader :layout

	def initialize
		@layout = ["a1", "a2", "a3", "a4",
                "b1", "b2", "b3", "b4",
                "c1", "c2", "c3", "c4",
                "d1", "d2", "d3", "d4"]
		@ships = []
    @shots = []
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

  def place_ship(type, size)
    placed = false
    while placed == false
      puts "The grid has A1 at the top left and D4 at the bottom right."
      puts "Enter the squares for the #{type} #{size}-unit ship:"
      text_in = gets.chomp.downcase
      position = [text_in[0] + text_in[1],text_in[3] + text_in[4]]
      position.each do |coord|
        if @layout.include?("#{coord}")
          #more code here
        else
          puts "Bad input or coordinate is off the board."
        end
      end
    end
  end

end
