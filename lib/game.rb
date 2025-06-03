require_relative 'board'
require_relative 'player'
require_relative 'show'
require 'colorize'

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
    #TO DO : méthode faisant appel aux méthodes des autres classes (notamment à l'instance de Board). 
            # Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, 
            # passe au joueur suivant si la partie n'est pas finie.
    Show.new.show_board(@board)                # Affiche le plateau actuel grâce à la classe Show

    puts "\n#{@current_player.name} (#{@current_player.value}), c'est ton tour !"  # Affiche le nom du joueur courant et sa marque (X ou O)

    print "\nChoisis une case (ex : A1, B2...) : ".yellow
    choice = gets.chomp.upcase                # Récupère la saisie du joueur et la met en majuscules

    if @board.cases[choice] && @board.cases[choice].value == " "     # Vérifie que la case existe et qu'elle est vide

      @board.cases[choice].value = @current_player.value   # Remplit la case avec le symbole du joueur

      if @board.victory?(@current_player.value)       # Vérifie s'il y a une victoire avec cette grille

        @status = @current_player   # On stocke le gagnant dans @status (qui peut être un joueur ou "draw")

      elsif @board.full?
        @status = "draw"   # S'il n'y a plus de cases libres, et pas de gagnant → match nul

      else
        switch_player    # Sinon, on change de joueur
      end

    else
      puts "\n⛔️ Case invalide ou déjà prise. Réessaie...".blue

      sleep(2.5)    # Petite pause pour laisser le joueur lire l'erreur
    end
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    @board = Board.new
    @status = "on going"
    @current_player = @players.sample
  end

  def game_end
    
    Show.new.show_board(@board)       # Crée une nouvelle instance de Show et affiche le plateau actuel (@board)

    puts "\nFin de la partie !".red       # Affiche un message indiquant que la partie est terminée avec un saut de ligne

    if @status == "draw"               # Vérifie si le statut du jeu est égal à "draw", c’est-à-dire un match nul
      puts "\nMatch nul !"               # Si c’est un match nul, affiche ce message
    else
      puts "\nBravo #{@status.name}, tu as gagné !".magenta # Sinon, affiche un message de félicitations avec le nom du joueur gagnant (l’objet @status contient le joueur gagnant)
    end
  end

  def switch_player
  # Change le joueur courant : si c’est le premier, passe au deuxième, sinon inversement
    if @current_player == @players[0]
       @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end
end