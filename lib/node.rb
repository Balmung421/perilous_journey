class Node
  attr_reader :surname
  attr_accessor :next_node, :supplies

  def initialize(surname, supplies = Hash.new )
    @surname = surname
    @next_node = nil
    @supplies = supplies
  end

  def append(surname, supplies = {})
    if next_node
      @next_node.append(surname, supplies)
    else
      @next_node = Node.new(surname, supplies)
    end
  end

  def includes?(value)
    if value == @surname
      true
    elsif @next_node
      @next_node.includes?(value)
    else
      false
    end
  end

  def pop
    if @next_node.next_node
      @next_node.pop
    else
      dead_family = @next_node
      print "The #{@next_node.surname} family has died of dysentery"
      @next_node = nil
      dead_family
    end
  end
end
