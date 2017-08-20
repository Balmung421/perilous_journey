require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require './lib/wagon_train'


class WagonTrainTest < Minitest::Test

  attr_reader :wt

  def setup
    @wt = WagonTrain.new
  end

  def test_it_exists
    assert WagonTrain.new
  end

  def test_list
    assert_kind_of LinkedList, wt.list
    assert_nil wt.list.head
  end

  def test_append
    new_node = wt.append("Burke", {"pounds of food" => 200})
    assert_kind_of Node, new_node
    assert_equal new_node, new_node
  end

  def test_count
    wt.append("Burke")
    wt.append("Zach")
    wt.append("Jeremy")
    assert_equal 3, wt.count
  end

  def test_supplies
    wt.append("Burke", {"spare wagon tongues" => 3, "pounds of food" => 250})
    wt.append("Zach", {"pounds of food" => 125})
    wt.append("Jeremy", {"rounds of ammo" => 500})
    supplies = {"spare wagon tongues" => 3, "pounds of food" => 375, "rounds of ammo" => 500}
    assert_equal supplies, wt.supplies
  end

  def test_go_hunting
    wt.append("Burke", {"pounds of food" => 25})
    total_food = wt.go_hunting["pounds of food"]
    assert_equal total_food + 25, wt.supplies["pounds of food"]
  end
end
