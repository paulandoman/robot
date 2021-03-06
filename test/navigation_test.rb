require './lib/navigation'
require 'test/unit'

class NavigationTests < Test::Unit::TestCase
  def test_has_returns_true_if_direction_present
    result = Navigation.has? 'WEST'
    assert_true result
  end

  def test_has_returns_false_if_direction_absent
    result = Navigation.has? 'SOUTH-WEST'
    assert_false result
  end

  def test_get_returns_object
    result = Navigation.get Navigation::ALL.first.label
    assert_equal(result, Navigation::ALL.first)
  end
end
