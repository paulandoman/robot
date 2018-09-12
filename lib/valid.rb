require_relative 'table'

# Verifies if the location is on the table
module Valid
  def valid?(table, location)
    x = location.first
    y = location.last

    return false if non_integer_string?(x, y)

    x = x.to_i
    y = y.to_i

    x >= 0 && x < table.width && y < table.height && y >= 0
  end

  private

  # return true if one or more location strings cant be converted to integers
  def non_integer_string?(x_value, y_value)
    x_value.is_a?(String) && x_value.scan(/\d/).empty? || \
      y_value.is_a?(String) && y_value.scan(/\d/).empty?
  end
end
