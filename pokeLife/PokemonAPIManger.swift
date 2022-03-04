//
//  PokemonAPIManger.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/2/7.
//

import UIKit



class PokemonAPIManager {

////    var pokemonsArray: PokemonData?
//    var individualPokemonInfo: IndividualpokemonInfo?
////    var individualPokeURL: [String]?
//    var fullPokeinfo: [IndividualpokemonInfo]?
//    var pokemonModel: PokemonModel?
    
    
    
    
    
    func fetchPokemonData(urlString: String, completion: @escaping (PokemonData?) -> Void){
        //1. Create a URL
        if let url = URL(string: urlString){
        //2. Create a URLSession
        let session = URLSession.shared
        //3. Give the session a task
       let task = session.dataTask(with: url) { data, response, error in
           if error != nil {
               print("ERROR IN THE API HANDLER")
               print(error!)
               return
           }
       // deal with the data
       let decoder = JSONDecoder()
       do{
//           self.pokemonsArray = try decoder.decode(PokemonData.self, from: data! )
           let pokemonsData = try decoder.decode(PokemonData.self, from: data!)

           completion(pokemonsData)

//                    print(pokemonsData as Any)
       }
       catch {
           print("Error in the decoder")
           print(error)
       }

   }

   //4. Start the task
   task.resume()

       }

    }
 
    
// Each Pokemon Information based on URL caught from Results PokemonData array
    

    func fetchIndividualPokemon(urlString: String, completion: @escaping (IndividualpokemonInfo) -> ()){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession.shared

            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("ERROR IN THE API HANDLER")
                    print(error!)
                    return
                }
                // deal with the data
                let decoder = JSONDecoder()
                do{
                    let individualInfo = try decoder.decode(IndividualpokemonInfo.self, from: data! )
//
//                    print(individualInfo as Any)
                    completion(individualInfo)
                }
                catch {
                    print("Error in the decoder")
                    print(error)
                }

            }

            //4. Start the task
            task.resume()
        }

    }
    


}

