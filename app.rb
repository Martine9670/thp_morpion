require_relative './lib/board'
require_relative './lib/boardcase'
require_relative './lib/game'
require_relative './lib/player'
require_relative './lib/show'

puts "Bienvenue dans le jeu du Morpion ! 🎮".magenta
game = Game.new

while game.status == "on going"
  game.turn
end

game.game_end

puts "\nSouhaitez-vous rejouer ? (o/n)".green
answer = gets.chomp.downcase
while answer == "o"
  game.new_round
  while game.status == "on going"
    game.turn
  end
  game.game_end

  puts "\nSouhaitez-vous rejouer ? (o/n)"
  answer = gets.chomp.downcase
end

puts "\nMerci d'avoir joué ! 👋".magenta
