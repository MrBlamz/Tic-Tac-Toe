# frozen_string_literal: true

# Creates a new Player
class Player
  attr_reader :marker, :name
  attr_writer :turn
  attr_accessor :wins

  @@chosen_names = []
  @@chosen_markers = []

  def initialize
    @name = ask_name
    @marker = ask_marker
    @turn = false
    @wins = 0
  end

  def play
    puts "\n#{@name} choose a number (1-9) to put your marker on the board"
    number = gets.chomp

    until (1..9).cover?(number.to_i)
      puts "\nPlease insert a valid number"
      number = gets.chomp
    end

    number.to_i - 1
  end

  def turn?
    @turn
  end

  def to_s
    @name
  end

  private

  def ask_name
    puts "\nPlayer name:"
    name = gets.chomp.capitalize

    while name.empty? || @@chosen_names.include?(name)
      puts "\nYour name cannot be empty or chosen by another player!"
      name = gets.chomp.capitalize
    end

    @@chosen_names.push(name)
    name
  end

  def ask_marker
    puts "\nInsert 1 letter or special character to be your game marker!"
    marker = gets.chomp.upcase
    regex = /^\D$/

    until marker.match(regex) && !@@chosen_markers.include?(marker)
      puts "\nPlease insert a valid marker!"
      marker = gets.chomp.upcase
    end

    @@chosen_markers.push(marker)
    marker
  end
end
