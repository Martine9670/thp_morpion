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
    puts "    1    2    3   "   # Affiche les numéros de colonnes en haut du tableau
    puts "  |....|....|....|"   # Affiche une ligne de séparation sous les numéros de colonnes

    ["A", "B", "C"].each do |row|   # Pour chaque ligne du plateau (A, B et C)
      print "#{row} |"     # Affiche la lettre de la ligne suivie d'une barre verticale pour commencer la ligne

      (1..3).each do |col|    # Pour chaque colonne (1 à 3) de la ligne courante
        pos = "#{row}#{col}"  # Construit la clé correspondant à la case (ex: "A1", "B3")
        print " #{@cases[pos].value}  |"  # Affiche la valeur de la case (X, O ou espace) entourée d’espaces et d’une barre verticale
      end

      puts "\n  |....|....|....|"   # Passe à la ligne suivante et affiche une ligne de séparation sous la ligne affichée
    end
  end

def victory?(symbol)
  # Définition de la méthode `victory?` qui prend en paramètre `symbol` (par exemple "X" ou "O")
  # Cette méthode va vérifier si ce symbole a réussi à aligner 3 cases (et donc a gagné)

      win_combinations = [   # Déclaration d’un tableau contenant toutes les combinaisons gagnantes possibles
        ["A1", "A2", "A3"],  # Première ligne horizontale
        ["B1", "B2", "B3"],  # Deuxième ligne horizontale
        ["C1", "C2", "C3"],  # Troisième ligne horizontale
        ["A1", "B1", "C1"],  # Première colonne verticale
        ["A2", "B2", "C2"],  # Deuxième colonne verticale
        ["A3", "B3", "C3"],  # Troisième colonne verticale
        ["A1", "B2", "C3"],  # Diagonale de haut gauche à bas droite
        ["A3", "B2", "C1"]   # Diagonale de haut droite à bas gauche
      ]

      i = 0       # Initialisation d'un compteur pour parcourir les combinaisons gagnantes
      while i < win_combinations.length   # Boucle tant qu'il reste des combinaisons à vérifier
        combo = win_combinations[i]   # On récupère la combinaison courante (ex: ["A1", "A2", "A3"])

        # Vérifier si toutes les cases de la combinaison ont la valeur 'symbol'
        count = 0     # Initialisation d'un compteur pour parcourir les cases de la combinaison
        all_match = true    # On suppose que toutes les cases correspondent au symbole tant qu'on ne trouve pas le contraire
        
        while count < combo.length    # Boucle tant qu'il reste des cases à vérifier dans la combinaison
          pos = combo[count]     # On récupère la position de la case courante (ex: "A1")
          
          if @cases[pos].value != symbol  # Si la valeur de cette case n'est pas égale au symbole du joueur
            all_match = false     # On marque que cette combinaison ne correspond pas à une victoire
            
            break     # On sort de la boucle interne car une seule différence suffit à invalider la combinaison
          end
          count += 1    # On passe à la case suivante dans la combinaison
        end

        return true if all_match   # Si toutes les cases correspondent, on retourne true (victoire détectée)
        i += 1   # On passe à la combinaison suivante
      end

      return false  # Aucune combinaison gagnante trouvée
    end
  def full?
    i = 0      # On initialise un compteur à 0 pour parcourir les cases du plateau
    keys = @cases.keys   # On récupère toutes les clés (positions comme "A1", "B2", etc.) du hash @cases

    while i < keys.length   # Tant qu’on n’a pas parcouru toutes les positions
      key = keys[i]       # On récupère la position actuelle (ex: "A1")
      
      if @cases[key].value == " "    # Si la valeur de cette case est vide (donc non jouée)
        return false    # Alors la grille n’est pas encore pleine, on retourne false immédiatement
      end

      i += 1     # Sinon, on passe à la position suivante en incrémentant le compteur
    end

    return true  # Si on a vérifié toutes les cases et qu’aucune n’est vide, la grille est pleine → on retourne true
  end
end