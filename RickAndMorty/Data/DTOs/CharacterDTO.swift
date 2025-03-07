//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 5/3/25.
//

import Foundation

struct CharacterListDTO: Codable {
    struct Info: Codable {
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [CharacterDTO]
}

struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: LocationDTO?
    let location: LocationDTO?
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    func toDomain() -> Character {
        return Character(
            id: id,
            name: name,
            status: CharacterStatus(rawValue: status) ?? .unknown,
            species: species,
            type: type ?? "",
            gender: gender,
            origin: origin?.name ?? "N/A",
            location: location?.name ?? "N/A",
            image: image,
            episode: episode
        )
    }
}

enum CharacterStatus: String, CaseIterable, Identifiable {
    case all = "All"
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"

    var id: String { self.rawValue }

    var apiValue: String? {
        self == .all ? nil : rawValue.lowercased()
    }
}

struct LocationDTO: Codable {
    let name: String
    let url: String
}

extension Array where Element == CharacterDTO {
    func toDomain() -> [Character] {
        return map { $0.toDomain() }
    }
}
