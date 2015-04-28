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

  defind_method(:rest) do   # affects health and size

  end

end
