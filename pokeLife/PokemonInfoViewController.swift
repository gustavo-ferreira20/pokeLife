//
//  PokemonInfoViewController.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/1/26.
//

import UIKit

class PokemonInfoViewController: UIViewController {

    @IBOutlet weak var pokemonnameLabel: UILabel!
    
    var pokemonName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonnameLabel.text = pokemonName
        print(pokemonName as Any)
        print("Showed up")
    }
    

 
    @IBAction func didClosePress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
