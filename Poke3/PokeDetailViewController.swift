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
    @IBOutlet var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: String(poke.pokedeID))
        mainImage.image = image
        currentEvoImage.image = image
        pokeIDLabel.text = String(poke.pokedeID)
        titleLabel.text = poke.name.uppercased()
        poke.downloadPokeDetails {
            self.updateUI()
        }
    }

    func updateUI() {
        baseID.text = poke.attack
        defenseLabel.text = poke.defense
        heightLabel.text = poke.height
        weightLabel.text = poke.weight
        typeLabel.text = poke.type
        descriptionLabel.text = poke.description
        if poke.nextEvolutionID == "" {
            evoLabel.text = "No Evlolutions"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: poke.nextEvolutionID)
        }
        let nexEvoString = "Next Evolution Name: \(poke.nextEvolutionName) | LVL \(poke.nextEvolutionID)"
        evoLabel.text = nexEvoString
        if segmentedControl.selectedSegmentIndex == 0 {
        } else {
            descriptionLabel.text = poke.description

        }
    }

    @IBAction func backPuttonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didSelect(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            descriptionLabel.text = poke.description
        } else {
            descriptionLabel.text = poke.movesDesc
        }
    }
}







