require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test

  attr_reader :linked_list

  def setup
    @linked_list = LinkedList.new
  end

  def test_it_exists
    assert LinkedList.new
  end

  def test_it_is_initialized_with_a_nil_head
    assert_nil linked_list.head
  end

  def test_append
    node = linked_list.append("Zelda", {"pounds of food" => 189})
    assert_kind_of Node, node
    assert_equal node, linked_list.head
    assert_nil linked_list.head.next_node
  end

  def test_append_more_than_one
    head = linked_list.append("Zelda")
    zach = linked_list.append("Zach")
    assert_equal head, linked_list.head
    assert_equal zach, linked_list.head.next_node
  end

  def test_count_one_node
    linked_list.append("Zelda")
    assert_equal 1, linked_list.count
  end

  def test_count_multiple_nodes
    linked_list.append("Zelda")
    linked_list.append("Zach")
    linked_list.append("Booker")
    assert_equal 3, linked_list.count
  end

  def test_count_with_prepend
    linked_list.append("Zelda")
    linked_list.prepend("Zach")
    assert_equal 2, linked_list.count
  end

  def test_to_string
    linked_list.append("Zelda")
    assert_equal "The Zelda family", linked_list.to_string
    linked_list.append("Zach")
    linked_list.append("Booker")
    string = "The Zelda family, followed by the Zach family, followed by the Booker family"
    assert_equal string, linked_list.to_string
  end

  def test_format_families
    surnames = ["Zelda", "Zach", "Brooks"]
    string = "The Zelda family, followed by the Zach family, followed by the Brooks family"
    assert_equal string, linked_list.send(:format_families, surnames)
  end

  def test_prepend
    linked_list.append("Zach")
    linked_list.prepend("Booker", {"pounds of food" => 189})
    string = "The Booker family, followed by the Zach family"
    assert_equal string, linked_list.to_string
  end

  def test_prepend_multiple
    linked_list.append("Zach")
    linked_list.prepend("Booker")
    linked_list.prepend("Jeremy")
    string = "The Jeremy family, followed by the Booker family, followed by the Zach family"
    assert_equal string, linked_list.to_string
  end

  def test_insert
    linked_list.append("Zach")
    linked_list.append("Booker")
    inserted_node = linked_list.insert(1, "Small", {"pounds of food" => 189})
    string = "The Zach family, followed by the Small family, followed by the Booker family"
    assert_kind_of Node, inserted_node
    assert_equal string, linked_list.to_string
    assert_equal 3, linked_list.count
  end

  def test_find
    node_1 = linked_list.append("Zach")
    node_2 = linked_list.append("Booker")
    node_3 = linked_list.append("Oima")
    string = "The Booker family"
    assert_equal string, linked_list.find(1, 1)
  end

  def test_find_multiple
    node_1 = linked_list.append("Zach")
    node_2 = linked_list.append("Booker")
    node_3 = linked_list.append("Oima")
    string = "The Booker family, followed by the Oima family"
    assert_equal string, linked_list.find(1, 2)
  end

  def test_includes?
    node_1 = linked_list.append("Zach")
    node_2 = linked_list.append("Booker")
    assert linked_list.includes?("Zach")
    refute linked_list.includes?("Oima")
  end

  def test_pop
    node_1 = linked_list.append("Zach")
    node_2 = linked_list.append("Booker")
    assert_equal node_2, linked_list.pop
    assert_equal "The Zach family", linked_list.to_string
    assert_equal 1, linked_list.count
  end

  def test_pop_one_node
    node_1 = linked_list.append("Zach")
    assert_equal node_1, linked_list.pop
    assert_equal 0, linked_list.count
  end
end
