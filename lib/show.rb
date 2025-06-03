require 'colorize'

class Show
  def show_board(board)
    # Affiche l'en-tête des colonnes
    puts "    1   2   3 "
    puts "  -------------"

    # Les lignes A, B, C sont stockées dans un tableau
    row_labels = ['A', 'B', 'C']
    row_label_index = 0

    # Boucle sur chaque ligne (A, B, C)
    while row_label_index < row_labels.length
      row_label = row_labels[row_label_index]  # Par exemple, 'A'

      print "#{row_label} |"  # Affiche 'A |' en bleu

      column_number = 1
      # Boucle sur les colonnes (1, 2, 3)
      while column_number <= 3
        # Récupère la valeur de la case, comme 'A1', 'A2', etc.
        case_value = board.cases["#{row_label}#{column_number}"].value

      # Applique une couleur selon la valeur de la case
        colored_value = case case_value
          when 'X' then case_value.cyan
          when 'O' then case_value.magenta
          else case_value
          end

        # Affiche la case colorée
        print " #{colored_value} |"       
        
        column_number += 1
      end

      puts  # saut de lignes
      puts "  -------------"
      row_label_index += 1
    end
  end
end
