class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
    attr_accessor :cases, :count_turn

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    positions = ["A1", "A2", "A3",
                 "B1", "B2", "B3",
                 "C1", "C2", "C3"]

    @cases = {}  # Création d’un hash pour stocker les 9 cases

    index = 0  # On initialise un compteur à 0 pour parcourir le tableau positions

    while index < positions.length    # On boucle tant qu'on n'a pas traité les 9 positions
      pos = positions[index]    # On récupère l’identifiant de case à la position actuelle (ex : "A1", "B2", etc.)
      @cases[pos] = BoardCase.new(pos, " ")    # On crée une nouvelle instance de BoardCase avec cet identifiant, et on l’ajoute au hash @cases
      index += 1    # On incrémente le compteur pour passer à la case suivante
    end

    @count_turn = 0    # On initialise le compteur de tours à 0
  end

  def display_board
    puts "    1    2    3   "
    puts "  |....|....|....|"
    puts "A |    |    |    |"
    puts "  |....|....|....|"
    puts "B |    |    |    |"
    puts "  |....|....|....|"
    puts "C |    |    |    |"
    puts "  |....|....|....|"

  end

  def play_turn
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  end
end