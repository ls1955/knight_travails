# frozen_string_literal: true

# chess coordinate which knows its previous point
class Coordinate
  attr_accessor :x, :y, :prev_point

  def initialize(x_coord, y_coord, prev_point = nil)
    @x = x_coord
    @y = y_coord
    @prev_point = prev_point
  end

  def to_s
    "[#{@x}, #{@y}]"
  end
end
