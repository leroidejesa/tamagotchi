class Tamagotchi
  @@current_pet = []  #name, age, health, happiness, hunger, size, type

  define_method(:initialize) do |name, type|
    @name = name
    @type = type
    @age = 0
    @health = 100 - rand(20)
    @happiness = 60 - rand(10)
    @hunger = 50
    @size = "tiny"    #diminuitive, tiny, small medium, large, huge, gargantuan, colossal
  end

  define_method(:feed) do     # affects health and hunger and size

  end

  define_method(:play) do     # affects happiness and hunger

  end

  define_method(:love) do   # affects happiness

  end

  define_method(:rest) do   # affects health and size

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
