class Navigation
  NORTH = [0, 1].freeze
  EAST = [1, 0].freeze
  SOUTH = [0, -1].freeze
  WEST = [-1, 0].freeze

  # Represent all points on the compass 90 degrees apart
  ALL = [NORTH, EAST, SOUTH, WEST].freeze
end
