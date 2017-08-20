class LinkedList
  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(surname, supplies = {})
    @count += 1
    if @head
      @head.append(surname, supplies)
    else
      @head = Node.new(surname, supplies)
    end
  end

  def prepend(surname, supplies = {})
    @count += 1
    if @head
      next_node = @head
      @head = Node.new(surname, supplies)
      @head.next_node = next_node
    else
      @head = Node.new(surname, supplies)
    end
  end

  def insert(insertion_point, surname, supplies = {})
    @count += 1
    current_node = @head
    (insertion_point - 1).times do
      current_node = current_node.next_node
    end
    new_node = Node.new(surname, supplies)
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def find(position, amount)
    current_position = 0
    current_node = @head
    families = []

    until current_position > position + amount do
      break unless current_node
      if current_position >= position && current_position < position + amount
        families << current_node.surname
      end
      current_position += 1
      current_node = current_node.next_node
    end

    format_families(families)
  end

  def to_string
    node = head
    families = []
    while node
      families << node.surname
      node = node.next_node
    end
    format_families(families)
  end

  def includes?(value)
    if @head
      @head.includes?(value)
    else
      false
    end
  end

  def pop
    @count -= 1
    if @head.next_node
      @head.pop
    else
      dead_family = @head
      @head = nil
      dead_family
    end
  end

  def supplies
    node = @head
    supplies = {}
    while node
      supplies.merge!(node.supplies) { |key, v1, v2| v1 + v2 }
      node = node.next_node
    end
    supplies
  end

  private

  def format_families(surnames)
    surnames.map! do |surname|
      "the #{surname} family"
    end

    surnames[0][0] = surnames[0][0].upcase

    surnames.join(", followed by ")
  end
end
