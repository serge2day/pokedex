//
//  PokemonDetailVCViewController.swift
//  Pockedex
//
//  Created by Serge Bogachev on 29.03.16.
//  Copyright © 2016 Theros AG. All rights reserved.
//

import UIKit

class PokemonDetailVCViewController: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDefence: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblPokedexID: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblBaseAttack: UILabel!

    @IBOutlet weak var imgCurrentEvo: UIImageView!
    @IBOutlet weak var imgNextEvo: UIImageView!
    @IBOutlet weak var lblEvoText: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = pokemon.name
        let image = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = image
        imgCurrentEvo.image = image
        
        pokemon.downloadPokemonDetails { 
            //this will be called after download is done
            self.updateUI()
        }

    }
    
    func updateUI() {
        lblDescription.text = pokemon.description
        lblType.text = pokemon.type
        lblDefence.text = pokemon.defence
        lblHeight.text = pokemon.height
        lblWeight.text = pokemon.weight
        lblBaseAttack.text = pokemon.attack
        lblPokedexID.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutuionID == "" {
            lblEvoText.text = "No Evolutions"
            imgNextEvo.hidden = true
        } else {
            imgNextEvo.hidden = false
            imgNextEvo.image = UIImage(named: pokemon.nextEvolutuionID)
            var str = "Next Evolution: \(pokemon.nextEvolutuionText)"
            
            if pokemon.nextEvolutuionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutuionLevel)"
            }
            lblEvoText.text = str
        }
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }



}
