require("sinatra")
require("sinatra/reloader")
require("./lib/tamagotchi")
also_reload("lib/**/*.rb")

get ("/") do
  erb(:index)
end

post ("/updated_status") do
  @name = params.fetch('name')
  @type = params.fetch('type')
  @new_pet = Tamagotchi.new(@name, @type)
  @new_pet.add()
  @pet_age = @new_pet.get_age()
  @pet_happiness = @new_pet.get_happiness()
  @pet_health = @new_pet.get_health()
  @pet_hunger = @new_pet.get_hunger()
  @pet_size = @new_pet.get_size()
  @new_pet.add()
  erb(:updated_status)
end

get ("/updated_status") do
  @new_pet = Tamagotchi.all()[0]
  @new_pet = @new_pet.update_status()
  @name = @new_pet.get_name()
  @type = @new_pet.get_type()
  @pet_age = @new_pet.get_age()
  @pet_happiness = @new_pet.get_happiness()
  @pet_health = @new_pet.get_health()
  @pet_hunger = @new_pet.get_hunger()
  @pet_size = @new_pet.get_size()
  erb(:updated_status)
end
