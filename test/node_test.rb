require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  attr_reader :node

  def setup
    @node = Node.new("Zach")
  end
  def test_it_is_initialized_with_a_surname
    assert_equal "Zach", node.surname
  end

  def test_it_has_a_next_pointer
    assert_nil node.next_node
  end

  def test_append
    next_node = node.append("Cuphead")
    assert_kind_of Node, next_node
    assert_equal next_node, node.next_node
    tail_node = node.append("West")
    assert_equal tail_node, node.next_node.next_node
  end

  def test_includes?
    node = Node.new('Zach')
    assert node.includes?('Zach')
  end

  def test_pop
    popped_node = node.append("Cuphead")
    assert_equal popped_node, node.pop
  end

  def test_supplies
    supplies = {"pounds of jerky" => 189}
    node = Node.new("Zach", supplies)
    assert_equal supplies, node.supplies
  end
end
