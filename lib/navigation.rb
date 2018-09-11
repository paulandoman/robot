# facing objects and helper methods
module Navigation
  # represents a direction with label and coordinates (x, y)
  class Facing
    attr_reader :label, :coordinates

    def initialize(label, coordinates)
      @label = label
      @coordinates = coordinates
    end

    def to_s
      @label
    end

    def ==(other)
      return true if @label == other.label
    end
  end

  # Represent all points on the compass 90 degrees apart
  ALL = [
    Facing.new('north', [0, 1]),
    Facing.new('east', [1, 0]),
    Facing.new('south', [0, -1]),
    Facing.new('west', [-1, 0])
  ].freeze

  # return true if string is contained within label attribute of any
  # of the Facing objects stored in the ALL array
  def self.has?(direction)
    ALL.any? { |x| x.label == direction.downcase }
  end

  # return the Facing object given a label name
  def self.get(label)
    ALL.find { |x| x.label == label.downcase }
  end
end
