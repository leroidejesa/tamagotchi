class Tamagotchi
  @@this_pet = []

  define_method(:initialize) do |name, type|
    @dead = false
    @name = name
    @type = type
    @age = 0
    @health = 80
    @happiness = 60
    @hunger = 50
    @size_current = 0
    @size_rating = 1
    @size_increment = { 0 => "diminuitive", 1 => "tiny",
                        2 => "small", 3 => "medium",
                        4 => "large", 5 => "huge",
                        6 => "gargantuan", 7 => "colossal" }
    @size = @size_increment.fetch(@size_rating)    #diminuitive, tiny, small medium, large, huge, gargantuan, colossal
    @last_rest = Time.new(0001, 1, 1)
    @last_rest2 = Time.new(0001, 1, 1)
    @health_timer = Time.now()
    @happiness_timer = Time.now()
    @hunger_timer = Time.now()
    @age_timer = Time.now()
  end

  define_method(:add) do
    @@this_pet.push(self)
  end

  define_singleton_method(:all) do
    @@this_pet
  end

  define_method(:update_status) do
    @current_time = Time.now()
    @elapsed_health_time = (@current_time - @health_timer).to_i
    @elapsed_happiness_time = (@current_time - @happiness_timer).to_i
    @elapsed_hunger_time = (@current_time - @hunger_timer).to_i
    @age = (@current_time - @age_timer).div(60)
    if @elapsed_health_time > 10
      @health -= 5 * @elapsed_health_time.div(10)
    end
    if @elapsed_happiness_time > 10
      @happiness -= 5 * @elapsed_happiness_time.div(10)
    end
    if @elapsed_hunger_time > 10
      @hunger -= 5 * @elapsed_hunger_time.div(10)
    end
    if @health <= 0 || @hunger <= 0
      if @health <= 0
        @health = 0
      end
      if @hunger <= 0
        @hunger = 0
      end
      @dead = true
      "Your pet has died."
    end
    self
  end

  define_method(:feed) do     # affects health and hunger and size
    if @hunger < 100 && !@dead
      @health += 5
      @hunger += 5
      @size_current += 10
    end
    if @size_current >= 100
      @size_rating += 1
    end
  end

  define_method(:play) do     # affects happiness and hunger
    if @hunger > 30 && !@dead
      @happiness += 5
      @hunger -= 5
    else
      "your pet is too hungry to play. please feed your pet."
    end
  end

  define_method(:love) do   # affects happiness
    if @happiness < 100 && !@dead
      @happiness += 10
    end
  end

  define_method(:rest) do   # affects health and size_current
    if ((@size == "tiny" && @size_current < 50) && !@dead) || ((@last_rest.min > 10 || @last_rest2.min > 10 ) && !@dead)
      @health += 10
      @size_current += 10
      @last_rest2 = @last_rest
      @last_rest = Time.new(0001, 1, 1)
    else
      "Your pet is not tired. It has rested too recently."
    end
    if @health > 100
      @health = 100
    end
    if @size_current >= 100
      @size_rating += 1
    end
  end

  define_method(:get_name) do
    @name
  end

  define_method(:get_age) do
    @age
  end

  define_method(:get_happiness) do
    @happiness
  end

  define_method(:get_health) do
    @health
  end

  define_method(:get_hunger) do
    @hunger
  end

  define_method(:get_size) do
    @size
  end

  define_method(:get_type) do
    @type
  end

end
