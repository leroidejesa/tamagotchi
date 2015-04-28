require('rspec')
require('tamagotchi')

describe(Tamagotchi) do

  describe('#initialize') do
    it("gives birth to your new pet, setting its name, type, and initial values") do
      reptar = Tamagotchi.new("reptar", "dragon")
      expect(reptar.get_name()).to(eq("reptar"))
      expect(reptar.get_type()).to(eq("dragon"))
    end
  end

  describe('#feed') do
    it("feeds pet to a max of 100 hunger rating by increments of 5, also increases health by 5, and size by 10") do
      reptar = Tamagotchi.new("reptar", "dragon")
      reptar.feed
      expect(reptar.get_hunger()).to(eq(55))
      expect(reptar.get_health()).to(eq(85))
      expect(reptar.get_size()).to(eq("tiny"))
    end
  end

  describe('#play') do
    it("interacts with pet to increase happiness and decrease hunger bar") do
      reptar = Tamagotchi.new("reptar", "dragon")
      reptar.play
      expect(reptar.get_happiness()).to(eq(65))
      expect(reptar.get_hunger()).to(eq(45))
    end
  end

  describe('#love') do
    it("interact with pet to increase happiness") do
      reptar = Tamagotchi.new("reptar", "dragon")
      reptar.love
      expect(reptar.get_happiness()).to(eq(70))
    end
  end

  describe('#rest') do
    it("increases health and current size limited to 10 each, up to 2 rests per 10m") do
      reptar = Tamagotchi.new("reptar", "dragon")
      reptar.rest
      expect(reptar.get_health()).to(eq(90))
      expect(reptar.get_size()).to(eq("tiny"))
    end
  end
end
