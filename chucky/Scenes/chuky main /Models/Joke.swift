//
//  Joke.swift
//  chucky
//
//  Created by Lasha Tavberidze on 14.01.25.
//

import Foundation

struct Joke: Codable {
    let categories: [Category]
    let createdAt: String
    let updatedAt: String?
    let id: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case id = "id"
        case value = "value"
    }
}
enum Category: String, Codable{
    case animal = "animal"
    case career = "career"
    case celebrity = "celebrity"
    case dev = "dev"
    case explicit = "explicit"
    case fashion = "fashion"
    case food = "food"
    case history = "history"
    case money = "money"
    case movie = "movie"
    case music = "music"
    case political = "political"
    case religion = "religion"
    case science = "science"
    case sport = "sport"
    case travel = "travel"
}
