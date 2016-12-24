//
//  RootViewController.swift
//  Poke3
//
//  Created by Matt Deuschle on 12/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import AVFoundation

class RootViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!

    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        parsePokemonCSV()
//        initAudio()
    }

    func initAudio() {

        if let path = Bundle.main.path(forResource: "music", ofType: "mp3") {
            do {
                if let pathURL = URL(string: path) {
                    musicPlayer = try AVAudioPlayer(contentsOf: pathURL)
                    musicPlayer.prepareToPlay()
                    musicPlayer.numberOfLoops = -1
                    musicPlayer.play()
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
    }

    func parsePokemonCSV() {

        if let path = Bundle.main.path(forResource: "pokemon", ofType: "csv") {
            do {
                let csv = try CSV(contentsOfURL: path)
                let rows = csv.rows

                for row in rows {
                    if let pokeName = row["identifier"], let pokeID = row["id"] {
                        if let pokeIDInt = Int(pokeID) {
                            let poke = Pokemon(name: pokeName, pokedexID: pokeIDInt)
                            pokemon.append(poke)
                        }
                    }
                }

            } catch let err as NSError {
                print(err.debugDescription)
            }
        }


    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell else {
            return UICollectionViewCell()
        }
        let poke = pokemon[indexPath.row]
        cell.configCell(poke)
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }


}
