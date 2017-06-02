require_relative 'game_classes'
require_relative 'pokemons_seed'

player_1 = Player.new('cruzeta', Bulbasaur)
player_2 = Player.new('toguri', Charmander)

while player_1.pokemon.alive? && player_2.pokemon.alive?
  #player 1 turn
  player_2.pokemon.hp -= (player_1.pokemon.attack  - player_2.pokemon.defense)
  #player 2 turn
  player_1.pokemon.hp -= (player_2.pokemon.attack - player_1.pokemon.defense)
  puts player_1.pokemon.hp
  puts player_2.pokemon.hp
end
