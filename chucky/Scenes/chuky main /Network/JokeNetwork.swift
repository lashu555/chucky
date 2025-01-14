//
//  JokeNetwork.swift
//  chucky
//
//  Created by Lasha Tavberidze on 14.01.25.
//

import Foundation

class JokeNetwork {
    let baseUrlString: String = "https://api.chucknorris.io/jokes/random?category="
    func fetchAJoke(category: Category,
                    completion: @escaping (Result<Joke,Error>) -> ())
    {
        guard let url = URL(string: baseUrlString + category.rawValue) else {
            fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data {
                let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(Joke.self, from: data)
                        completion(.success(decodedData))
                }catch{
                    print("couldn't decode Joke")
                    completion(.failure(error))
                        completion(.failure(error))
                }
            }
        }.resume()
    }
}
