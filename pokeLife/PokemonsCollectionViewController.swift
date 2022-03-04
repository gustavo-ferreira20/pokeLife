//
//  PokemonsCollectionViewController.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/1/26.
//

import UIKit

class PokemonsCollectionViewController: UIViewController {
    
    private var pokemonAPIManager = PokemonAPIManager()
    private var myIndex = 0
    
    private lazy var searchBars:UISearchBar = UISearchBar(frame: CGRect(x: 0,y: 0,width: 280,height: 10))
//    if the Collection view doent show all itens, just go to Collection View Flow Layout in the Storyboard and change the "Estimate Size" to none
    private var typeArrays = ["Normal", "Fire", "Water", "Grass", "Eletric", "Ice", "Fighting","Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Dark", "Dragon", "Steel", "Fairy", "Ghost"]
    
    private var pokemonURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
    private var individualURL = ""
//    private var individualPokemonInfo = "https://pokeapi.co/api/v2/pokemon/1/"
    
    private var pokemons: PokemonData?
    private var individualPokemon: IndividualpokemonInfo?
    
  


    override func viewDidLoad() {
        self.pokemonsCollectionView.backgroundColor = .clear
        self.typeView.backgroundColor = .clear
        super.viewDidLoad()
        layoutDetails()
  
////        //API request
        
        pokemonAPIManager.fetchPokemonData(urlString: pokemonURL) { (pokemons) in
            self.pokemons = pokemons
//            self.gettingEachURL()
            DispatchQueue.main.async {
//                print(pokemons as Any)
                self.pokemonsCollectionView.reloadData()
            }
        }
 
        
        
    }
    
    @IBOutlet weak var typeView: UICollectionView!
    @IBOutlet weak var pokemonsCollectionView: UICollectionView!
    
 
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
 
    // Passing Data to PokemonInfoView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PokeInfoSegue") {
            let pokemonInfoView = segue.destination as! PokemonInfoViewController
            
//            pokemonInfoView.pokemonName = pokemonAPIManager.pokemonsArray?.results?[myIndex].name
            pokemonInfoView.pokemonName = pokemons?.results?[myIndex].name
            pokemonInfoView.pokemonIndividualURL = pokemons?.results?[myIndex].url
        }
    }
        

}

// CollectionView for the button of pokemon types and each Pokemon from API

extension PokemonsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typeView {
            return typeArrays.count
        } else{
//            return pokemonAPIManager.pokemonsArray?.results?.count ?? 0
            return pokemons?.results?.count ?? 0
                
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.typeView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeButton", for: indexPath) as! TypeButtonsColleCollectionViewCell
            
            cell.typeButton.setTitle(typeArrays[indexPath.row], for: .normal)
            
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonList", for: indexPath) as! PokemonListCollectionViewCell
            
//            cell.pokemonName.text = pokemonAPIManager.pokemonsArray?.results?[indexPath.row].name
            cell.pokemonName.text = pokemons?.results?[indexPath.row].name

            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            
            if let pokeUrl = pokemons?.results?[indexPath.row].url{
//                print(pokeUrl)
                pokemonAPIManager.fetchIndividualPokemon(urlString: pokeUrl) { individualPokemon in
                    self.individualPokemon = individualPokemon
//                    print(individualPokemon.name)
//                    print(individualPokemon.types)
//                    print(individualPokemon.types[0].type.name)
                    DispatchQueue.main.async {
//                        cell.pokemonType.text = individualPokemon.name
//                        cell.pokemonType.text = individualPokemon.types[0].type.name
//                        cell.pokemonType.text = individualPokemon.types[0].type.name
                        if individualPokemon.types.count == 1{
                            cell.pokemonType.text = individualPokemon.types[0].type.name
                        } else{
                            cell.pokemonType.text = "\(individualPokemon.types[0].type.name) / \(individualPokemon.types[1].type.name)"
                        }
                    }
                }
            }
            
            
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        obtain all cell info upon clicking
//        print(pokemonAPIManager.pokemonsArray?.results?[indexPath.row].name ?? "no name available")
        print(pokemons?.results?[indexPath.row].name ?? "no name available")
        myIndex = indexPath.row
//        print("Poke URL: \(String(describing: pokemonAPIManager.pokemonsArray?.results?[myIndex].url))")
        print("Poke URL: \(String(describing: pokemons?.results?[myIndex].url))")
    
        // Redirecting to PokemonInfoView
        
        self.performSegue(withIdentifier: "PokeInfoSegue", sender: self)
    }
    
    
}
