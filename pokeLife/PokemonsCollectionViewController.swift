//
//  PokemonsCollectionViewController.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/1/26.
//

import UIKit

class PokemonsCollectionViewController: UIViewController {
    
   private lazy var searchBars:UISearchBar = UISearchBar(frame: CGRect(x: 0,y: 0,width: 300,height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightBarButton = UIBarButtonItem(customView: searchBars)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    

    @IBAction func didPokemonClick(_ sender: Any) {
        self.performSegue(withIdentifier: "PokeInfoSegue", sender: self)
    }
    
 
    @IBAction func didMyInfoClick(_ sender: Any) {
        self.performSegue(withIdentifier: "MyInfoSegue", sender: self)
    }
    
}
