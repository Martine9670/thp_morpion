class Show
  # Méthode qui affiche le plateau de jeu passé en argument (un objet Board)
  def show_board(board)
    puts "    1   2   3 "   # Affiche l'en-tête des colonnes numérotées 1 à 3
    puts "  -------------"  # Affiche une ligne de séparation horizontale

    # Affiche la ligne A avec les valeurs des cases A1, A2, A3 du plateau
    puts "A | #{board.cases['A1'].value} | #{board.cases['A2'].value} | #{board.cases['A3'].value} |"
    puts "  -------------"  # Ligne de séparation

    # Affiche la ligne B avec les valeurs des cases B1, B2, B3 du plateau
    puts "B | #{board.cases['B1'].value} | #{board.cases['B2'].value} | #{board.cases['B3'].value} |"
    puts "  -------------"  # Ligne de séparation

    # Affiche la ligne C avec les valeurs des cases C1, C2, C3 du plateau
    puts "C | #{board.cases['C1'].value} | #{board.cases['C2'].value} | #{board.cases['C3'].value} |"
    puts "  -------------"  # Ligne de séparation finale
  end
end
