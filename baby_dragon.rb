# Baby Dragon! Aegon.

class Dragon
  def initialize(name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10  # He's full.
    @stuff_in_intestine = 0  # He doesn't need to go.

    puts "#{@name} is born."
  end

  def feed
    puts "You fed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walked #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke..."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly..."
    end
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts "He giggles, which singes your eyebrows."
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts 'He briefly doses off...'
    passage_of_time
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private
  # "private" means that the methods defined here are methods internal to the object. (You can feed your dragon, but you can't ask him whether he's hungry.)

  def hungry?
    # Method names can end with a question mark (?).
    # Usually, we do this only if the method returns true or false, like this:
    @stuff_in_belly <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      # Move food from belly to intestine.
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1
    else  # Our dragon is starving
      if @asleep
        @asleep = false
        puts "#{@name} wakes up suddenly!"
      end
      puts "#{@name} is starving! In desperation, he ate YOU!"
      puts "You are dead."
      exit  # Quits the program.
    end
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops...#{@name} had an accident..."
    end
    if hungry?
      if @asleep
        @asleep = false
        puts "#{@name} wakes up suddenly!"
      end
      puts "#{@name}'s stomach grumbles..."
    end
    if poopy?
      if @asleep
        @asleep = false
        puts "#{@name} wakes up suddenly!"
      end
      puts "#{@name} does the potty dance..."
    end
  end

end


def dragon_game (pet)
  puts 'Feed your dragon using:         feed'
  puts 'Walk your dragon using:         walk'
  puts 'Put your dragon to bed using:   put to bed'
  puts 'Toss your dragon using:         toss'
  puts 'Rock your dragon using:         rock'
  puts
  while true
    choice = gets.chomp
    case choice.downcase
    when "feed"
      pet.feed
    when "walk"
      pet.walk
    when "put to bed"
      pet.put_to_bed
    when "toss"
      pet.toss
    when "rock"
      pet.rock
    end
  end
end


puts
puts '-------------------------------------------'
puts 'BABY DRAGON: THE COMING OF SLEEPLESS NIGHTS'
puts '-------------------------------------------'
puts
puts 'You are walking along the rocky beach near the cliffs of Dragonstone.'
puts 'In the distance you notice a curvature amongest the sharp debris below the cliffs and make a start towards it.'
puts
puts 'You clamber over the rocks as the tide crashes against the jagged rocks mere feet from you. As you approach the pebble you notice...'
puts
puts 'It\'s a dragon\'s egg! Black scaled, almost armour-plated, with red and gold flashes.'
puts
puts 'It must have fallen from the cliff.'
puts
puts 'You pick it up and it begins to crack open in your hands.'
puts
puts 'A baby dragon rolls out onto your palm. It clambers to it\'s tiny feet, stretches it\'s wings and lets out a screech...and a puff of smoke with it.'
puts
puts '...what will you name him?'
puts
dragon = gets.chomp
pet = Dragon.new(dragon)
puts
dragon_game(pet)
