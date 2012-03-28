class @Roulette
  constructor: (@fonctionTirage)->
    @paris = []

  tirage: ->
    résultat = @fonctionTirage()
    @gagnant = @paris[résultat]
    résultat

  nouveauPari: (joueur, numéro)->
    return false if numéro of @paris
    @paris[numéro] = joueur
    return true

