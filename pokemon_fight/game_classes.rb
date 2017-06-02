
class Pokemon

  attr_accessor :id, :hp, :attack, :defense, :speed, :special, :total, :average

  def initialize(id,name,hp,attack,defense,speed,special,total,average)
    @id = id
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
    @speed = speed
    @special = special
    @total = total
    @average = average
  end

  def alive?
    @hp > 0 ? true : false
  end
end   

class Player

  attr_accessor :name, :pokemon

  def initialize(name, pokemon)
    @name = name
    @pokemon = pokemon
  end
end
