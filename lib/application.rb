class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    game = Game.new

     # Boucle principale du jeu : tant que le statut est "on going", on continue à jouer
    while game.status == "on going"
      # Le joueur courant joue son tour
      game.turn

      # On vérifie si le jeu est terminé (victoire ou match nul)
      game.game_end
    end
  end
end

Application.new.perform