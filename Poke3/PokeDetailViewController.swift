//
//  PokeDetailViewController.swift
//  Poke3
//
//  Created by Matt Deuschle on 12/24/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class PokeDetailViewController: UIViewController {

    var poke: Pokemon!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var defenseLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var pokeIDLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var baseID: UILabel!
    @IBOutlet var currentEvoImage: UIImageView!
    @IBOutlet var nextEvoImage: UIImageView!
    @IBOutlet var evoLabel: UILabel!






    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backPuttonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }


}
