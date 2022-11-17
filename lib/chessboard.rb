# frozen_string_literal: true

require_relative './coordinate'

# An 8 * 8 chessboard that check whether points is in bound
class Chessboard
  attr_accessor :start_point, :end_point, :visiteds, :queue, :knight_offsets

  def initialize
    @visiteds = Array.new(8) { Array.new(8, false) }
    @queue = []
    @knight_offsets = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1] ]
  end

  def knight_moves(start_point, end_point)
    @start_point = start_point.to_ary
    @end_point = end_point.to_ary
    reset
    visiteds[@start_point.first][@start_point.last] = true
    queue << Coordinate.new(@start_point.first, @start_point.last)

    until queue.empty?
      curr_move = queue.shift

      if reach_destination?(curr_move)
        print_result(curr_move)
        break
      else
        @knight_offsets.each do |offset|
          next_move = Coordinate.new(curr_move.x + offset.first, curr_move.y + offset.last, curr_move)

          if inbound?(next_move) && !visited?(next_move)
            queue << next_move
            visiteds[next_move.x][next_move.y] = true
          end
        end
      end
    end
  end

  def reach_destination?(point)
    point.x == @end_point.first && point.y == @end_point.last
  end

  def inbound?(point)
    point.x.between?(0, 7) && point.y.between?(0, 7)
  end

  def visited?(point)
    @visiteds[point.x][point.y]
  end

  def print_result(point)
    histories = []

    while point.prev_point
      histories.unshift(point)
      point = point.prev_point
    end

    puts "You made it in #{histories.length} moves! Here's your path:"
    puts "[#{@start_point.first}, #{@start_point.last}]"
    histories.each { |history| puts history }
    puts ''
  end

  def reset
    @visiteds = Array.new(8) { Array.new(8, false) }
    @queue.clear
  end
end
