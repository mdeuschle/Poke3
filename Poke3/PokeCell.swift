//
//  PokeCell.swift
//  Poke3
//
//  Created by Matt Deuschle on 12/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet var thumbImage: UIImageView!
    @IBOutlet var thumbLabel: UILabel!
    var pokemon: Pokemon!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
    }

    func configCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.thumbImage.image = UIImage(named: "\(self.pokemon.pokedeID)")
        self.thumbLabel.text = self.pokemon.name.capitalized
    }
}
