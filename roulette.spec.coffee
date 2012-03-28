{Roulette} = require './roulette'
elle = it

describe 'La roulette', ->

  elle 'tire un numéro', ->
    roulette = new Roulette (-> 42)
    expect(roulette.tirage()).toEqual 42

  elle 'sait tirer des numéros différents', ->
    i = 0
    roulette = new Roulette (-> i += 1)
    expect(roulette.tirage()).toEqual 1
    expect(roulette.tirage()).toEqual 2

  elle 'sait dire qui a gagné', ->
    roulette = new Roulette -> 42
    roulette.nouveauPari 'Paulo', 42
    roulette.nouveauPari 'Georgette', 49
    roulette.tirage()
    expect(roulette.gagnant).toEqual 'Paulo'

  elle 'se laisse pas faire si plusieurs sur le même numéro', ->
    roulette = new Roulette -> 42
    expect(roulette.nouveauPari 'Paulo', 42).toBeTruthy()
    expect(roulette.nouveauPari 'Georgette', 42).toBeFalsy()

  elle 'se laisse pas faire si plusieurs sur le même numéro même sans nom', ->
    roulette = new Roulette -> 42
    expect(roulette.nouveauPari '', 42).toBeTruthy()
    expect(roulette.nouveauPari 'Georgette', 42).toBeFalsy()

