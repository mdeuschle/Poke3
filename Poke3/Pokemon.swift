//
//  Pokemon.swift
//  Poke3
//
//  Created by Matt Deuschle on 12/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class Pokemon {

    fileprivate var _name: String
    fileprivate var _pokedexID: Int

    var name: String {
        return _name
    }

    var pokedeID: Int {
        return _pokedexID
    }

    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}
