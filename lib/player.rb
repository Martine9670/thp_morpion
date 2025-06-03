require 'colorize'

class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
    attr_reader :name, :value
  
  def initialize(name, value)
    #TO DO : doit régler son nom et sa valeur
    @name = name # nom du joueur
    @value = value # X ou O

  end
end