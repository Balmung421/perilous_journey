class WagonTrain

  ANIMALS = {"squirrel" =>  2, "deer" => 40, "bison" => 100}

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies = {})
    @list.append(surname, supplies)
  end

  def count
    @list.count
  end

  def supplies
    @list.supplies
  end

  def go_hunting
    animal_counts = {"squirrel" => 0, "deer" => 0, "bison" => 0 }
    total_food = 0

    rand(6).times do
      animal = ANIMALS.keys.sample
      total_food += ANIMALS[animal]
      animal_counts[animal] += 1
    end
      if animal_counts["squirrel"] == 1
        print "You got #{animal_counts["squirrel"]} squirrel, #{animal_counts["deer"]} deer, and #{animal_counts["bison"]} bison for a total of #{total_food} pounds of food"
        else
          print "You got #{animal_counts["squirrel"]} squirrels, #{animal_counts["deer"]} deer, and #{animal_counts["bison"]} bison for a total of #{total_food} pounds of food"
      end

    result = { "pounds of food" => total_food}
    @list.head.supplies.merge!(result) {|key, v1, v2| v1 + v2}

    result
  end

end
