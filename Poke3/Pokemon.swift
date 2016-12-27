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
    private var _nextEvolutionName: String!
    private var _nextEvolutionID: String!
    private var _nextEvolutionLevel: String!
    private var _pokemonURL: String!

    var nextEvolutionName: String {
        if _nextEvolutionName == nil {
            return ""
        }
        return _nextEvolutionName
    }

    var nextEvolutionID: String {
        if _nextEvolutionID == nil {
            return ""
        }
        return _nextEvolutionID
    }

    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            return ""
        }
        return _nextEvolutionLevel
    }

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
                if let types = dic["types"] as? [[String: String]], types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name2 = types[x]["name"] {
                                self._type! += " | \(name2.capitalized)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                if let descripArray = dic["descriptions"] as? [[String: String]], descripArray.count > 0 {
                    if let url = descripArray[0]["resource_uri"] {
                        let descURL = "\(BASE_URL)\(url)"
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            if let descripDic = response.result.value as? [String: Any] {
                                if let description = descripDic["description"] as? String {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self._description = newDescription
                                }
                            }
                            completed()
                        })
                    }
                } else {
                    self._description = ""
                }
                if let evolutions = dic["evolutions"] as? [[String: Any]], evolutions.count > 0 {
                    if let nextEvo = evolutions[0]["to"] as? String {
                        // not supporting mega, only continue if no megas
                        if nextEvo.range(of: "mega") == nil {
                            self._nextEvolutionName = nextEvo
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoID = newString.replacingOccurrences(of: "/", with: "")
                                self._nextEvolutionID = nextEvoID

                                if let levelExists = evolutions[0]["level"] {
                                    if let level = levelExists as? Int {
                                        self._nextEvolutionLevel = String(level)
                                    }

                                } else {
                                    self._nextEvolutionLevel = ""
                                }
                            }
                        }
                    }
                }
            }
            completed()
        }
    }
}








