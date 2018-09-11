# Verifies if the location is on the table
module Valid
  def valid?(location)
    x = location.first
    y = location.last

    return false if non_integer_string?(x, y)

    x = x.to_i
    y = y.to_i

    x >= 0 && x < Border::WIDTH && y < Border::HEIGHT && y >= 0
  end

  # return true if one or more location strings cant be converted to integers
  def non_integer_string?(x_value, y_value)
    x_value.is_a?(String) && x_value.scan(/\d/).empty? || \
      y_value.is_a?(String) && y_value.scan(/\d/).empty?
  end
end
