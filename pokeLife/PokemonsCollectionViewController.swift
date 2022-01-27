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
        layoutDetails()
    }
    

    @IBAction func didPokemonClick(_ sender: Any) {
        self.performSegue(withIdentifier: "PokeInfoSegue", sender: self)
    }
    
 
    @IBAction func didMyInfoClick(_ sender: Any) {
        self.performSegue(withIdentifier: "MyInfoSegue", sender: self)
    }
    
    
    private func layoutDetails(){
        let rightBarButton = UIBarButtonItem(customView: searchBars)
        searchBars.backgroundColor = UIColor.white
        searchBars.layer.cornerRadius = 10
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
}
