//
//  PokemonAPIManger.swift
//  pokeLife
//
//  Created by Gustavo rodrigues on 2022/2/7.
//

import UIKit



class PokemonAPIManager {

    var pokemonsArray: PokemonData?
    
    
    func performRequest(urlString: String, completed: @escaping () -> ()){
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
                    self.pokemonsArray = try decoder.decode(PokemonData.self, from: data! )
                    
//                    print("Here is my data \(self.recipesArray)")
                    print(self.pokemonsArray as Any)
                }
                catch {
                    print("Error in the decoder")
                    print(error)
                }
                completed()
            }

            //4. Start the task
            task.resume()
        }

    }
    
    
    
    
    


}

