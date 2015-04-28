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
end
