//
//  APIEndpoints.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 5/3/25.
//

import Foundation

struct APIEndpoints {
    static let baseURL = "https://rickandmortyapi.com/api"

    struct Character {
        static let list = "\(baseURL)/character"
        
        static func list(page: Int) -> String {
            return "\(baseURL)/character?page=\(page)"
        }
        
        static func detail(id: Int) -> String {
            return "\(baseURL)/character/\(id)"
        }
    }

    struct Episode {
        static let list = "\(baseURL)/episode"

        static func list(page: Int) -> String {
            return "\(baseURL)/episode?page=\(page)"
        }

        static func detail(id: Int) -> String {
            return "\(baseURL)/episode/\(id)"
        }
    }

    struct Location {
        static let list = "\(baseURL)/location"

        static func list(page: Int) -> String {
            return "\(baseURL)/location?page=\(page)"
        }

        static func detail(id: Int) -> String {
            return "\(baseURL)/location/\(id)"
        }
    }
}

