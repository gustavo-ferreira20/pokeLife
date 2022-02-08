//
//  PokemonsCollectionViewController.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/1/26.
//

import UIKit

class PokemonsCollectionViewController: UIViewController {
    
    private var pokemonAPIManager = PokemonAPIManager()
    
    private lazy var searchBars:UISearchBar = UISearchBar(frame: CGRect(x: 0,y: 0,width: 280,height: 10))
//    if the Collection view doent show all itens, just go to Collection View Flow Layout in the Storyboard and change the "Estimate Size" to none
    private var typeArrays = ["Normal", "Fire", "Water", "Grass", "Eletric", "Ice", "Fighting","Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Dark", "Dragon", "Steel", "Fairy", "Ghost"]
    
    private var pokemonURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
    private var individualPokemonInfo = "https://pokeapi.co/api/v2/pokemon/1/"
    private let apiKey = ""

    override func viewDidLoad() {
        self.pokemonsCollectionView.backgroundColor = .clear
        self.typeView.backgroundColor = .clear
        super.viewDidLoad()
        layoutDetails()
        
        //API request
        pokemonAPIManager.performRequest(urlString: pokemonURL) {
            DispatchQueue.main.async {
//                update UI with all API request here
                self.pokemonsCollectionView.reloadData()
            }
        }

    }
    
    @IBOutlet weak var typeView: UICollectionView!
    @IBOutlet weak var pokemonsCollectionView: UICollectionView!
    
    @IBAction func didPokemonClick(_ sender: Any) {
        self.performSegue(withIdentifier: "PokeInfoSegue", sender: self)
    }
    
 
    @IBAction func didMyInfoClick(_ sender: Any) {
        self.performSegue(withIdentifier: "MyInfoSegue", sender: self)
    }
    
    
    private func layoutDetails(){
        let rightBarButton = UIBarButtonItem(customView: searchBars)
        let leftBarButton = UIBarButtonItem(title:"        ", style:.plain, target: self, action: #selector(onTapButton))
        searchBars.backgroundColor = UIColor.white
        searchBars.layer.cornerRadius = 10
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc
    func onTapButton() {
        print("Button is tapped.")
    }
    
    
}

// CollectionView for the button of pokemon types and each Pokemon from API

extension PokemonsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typeView {
            return typeArrays.count
        } else{
            return pokemonAPIManager.pokemonsArray?.results?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.typeView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeButton", for: indexPath) as! TypeButtonsColleCollectionViewCell
            
            cell.typeButton.setTitle(typeArrays[indexPath.row], for: .normal)
            
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonList", for: indexPath) as! PokemonListCollectionViewCell
            
            cell.pokemonName.text = pokemonAPIManager.pokemonsArray?.results?[indexPath.row].name
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            
            return cell
        }
        
    }
    
    
}
