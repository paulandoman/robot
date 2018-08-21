# Navigation class contains direction vectors
class Navigation
  NORTH = ['north', 0, 1].freeze
  EAST = ['east', 1, 0].freeze
  SOUTH = ['south', 0, -1].freeze
  WEST = ['west', -1, 0].freeze

  # Represent all points on the compass 90 degrees apart
  ALL = [NORTH, EAST, SOUTH, WEST].freeze

  # return true if string is contained within first element of any
  # of the coordinates stored in the ALL array
  def self.has?(direction)
    ALL.any? { |x| x.first == direction.downcase }
  end
end
