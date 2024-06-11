require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    str = Starter.new.my_long_string
    @text_instance = Text.new(str)
  end

  def test_swap
    swapped_text = @text_instance.swap('a', 'e').chomp

    expected_text = <<-EXPECTED.chomp
      Lorem ipsum dolor sit emet, consectetur edipiscing elit.
      Cres sed vulputete ipsum. Suspendisse commodo sem ercu.
      Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum.
      Suspendisse ornere justo nulle, sit emet mollis eros sollicitudin et.
      Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne.
      Cres et verius meuris, et pheretre mi.
    EXPECTED

    assert_equal(expected_text, swapped_text)
  end

  def teardown
    @text_instance = nil
  end
end
