//
//  PokemonInfoViewController.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/1/26.
//

import UIKit

class PokemonInfoViewController: UIViewController {

    @IBOutlet weak var pokemonnameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var pokemonName: String?
    var pokemonIndividualURL: String?
    private var pokemonApiManager = PokemonAPIManager()
    private var individualPokemon: IndividualpokemonInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonnameLabel.text = pokemonName?.uppercased()
        pokemonDetails()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        print(pokemonName as Any)
        print(pokemonIndividualURL as Any)
    }
    

 
    @IBAction func didClosePress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func pokemonDetails(){
        if let pokeURL = pokemonIndividualURL{
            pokemonApiManager.fetchIndividualPokemon(urlString: pokeURL) { individualPokemon in
                self.individualPokemon = individualPokemon
                DispatchQueue.main.async {
                    //        Displaying the Image
                        guard let url = URL(string: individualPokemon.sprites.front_default) else {return}
                            do{
                               let data = try Data(contentsOf: url)
                                self.pokemonImage.image = UIImage(data: data)
                            }catch{
                                print("No Image")
                            }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension PokemonInfoViewController: UITableViewDelegate{
    
}

extension PokemonInfoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return individualPokemon?.moves.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = individualPokemon?.moves[indexPath.row].move.name
        cell.contentConfiguration = content
        
        return cell
    }
}
