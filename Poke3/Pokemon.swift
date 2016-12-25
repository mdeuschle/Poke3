//
//  Pokemon.swift
//  Poke3
//
//  Created by Matt Deuschle on 12/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {

    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!

    var nextEvolutionText: String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }

    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }

    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }

    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }

    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }

    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }

    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }

    var name: String {
        return _name
    }

    var pokedeID: Int {
        return _pokedexID
    }

    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        self._pokemonURL = "\(BASE_URL)\(POKEMON_URL)\(pokedeID)/"
    }

    func downloadPokeDetails(completed: @escaping DownloadComplete) {

        Alamofire.request(_pokemonURL).responseJSON { response in
            if let dic = response.result.value as? [String: Any] {
                if let weight = dic["weight"] as? String {
                    self._weight = weight
                }
                if let height = dic["height"] as? String {
                    self._height = height
                }
                if let attack = dic["attack"] as? Int {
                    self._attack = String(attack)
                }
                if let defense = dic["defense"] as? Int {
                    self._defense = String(defense)
                }

            }
            completed()
        }


    }
}








