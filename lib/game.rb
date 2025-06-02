require_relative 'board'
require_relative 'player'

class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), 
  # le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
    attr_accessor :current_player, :status, :board, :players

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    puts "Nom du joueur 1 (X) :"
    name1 = gets.chomp
    player1 = Player.new(name1, "X")

    puts "Nom du joueur 2 (O) :"
    name2 = gets.chomp
    player2 = Player.new(name2, "O")

    # Stocker les joueurs dans un tableau
    @players = [player1, player2]

    # Initialiser le tableau
    @board = Board.new

    # Statut du jeu
    @status = "on going"

    # Choix du joueur courant (aléatoire)
    @current_player = @players.sample
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). 
            # Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, 
            # passe au joueur suivant si la partie n'est pas finie.
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end