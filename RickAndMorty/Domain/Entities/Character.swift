//
//  CharacterEntity.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 5/3/25.
//

import Foundation

struct Character: Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let location: String
    let image: String
    let episode: [String]

    init(id: Int, name: String, status: String, species: String, type: String?, gender: String, location: String, image: String, episode: [String]) {
        self.id = id
        self.name = name
        self.status = status.capitalized
        self.species = species
        self.type = type
        self.gender = gender
        self.location = location
        self.image = image
        self.episode = episode
    }
    
    static let mock: Character = .init(
        id: 1,
        name: "Rick Sánchez",
        status: "Alive",
        species: "Human",
        type: nil,
        gender: "Male",
        location: "Citadel of Ricks",
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: []
    )
}
