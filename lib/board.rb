# frozen_string_literal: true

# Creates the board
class Board
  attr_reader :winner

  WINNING_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def added_marker?(location, marker)
    @grid[location].instance_of?(String) ? false : add_marker(location, marker)
  end

  def game_over?(player)
    if winner?(player)
      true
    else
      false
    end
  end

  def full?
    @grid.all?(String)
  end

  def clear_board
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def to_s
    "\n"\
    "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}\n"\
    "--+---+---\n"\
    "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}\n"\
    "--+---+---\n"\
    "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}\n"\
  end

  private

  def winner?(player)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |i| @grid[i] == player.marker }
    end
  end

  def add_marker(location, marker)
    @grid[location] = marker
  end
end
