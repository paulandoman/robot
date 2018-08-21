class Navigation
  NORTH = ['north', 0, 1].freeze
  EAST = ['east', 1, 0].freeze
  SOUTH = ['south', 0, -1].freeze
  WEST = ['west', -1, 0].freeze

  # Represent all points on the compass 90 degrees apart
  ALL = [NORTH, EAST, SOUTH, WEST].freeze
end
