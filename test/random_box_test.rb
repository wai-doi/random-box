require "test_helper"

class RandomBoxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RandomBox::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def setup
    @box = RandomBox::Box.new
  end

  def test_argument_type_error
    assert_raises(TypeError){@box.add("test")}
  end

  def test_draw_error
    assert_raises(){@box.draw}
  end
end
