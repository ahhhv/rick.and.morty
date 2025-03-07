//
//  Character.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 5/3/25.
//

import Foundation

struct Character: Identifiable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String?
    let gender: String
    let origin: String
    let location: String
    let image: String
    let episode: [String]

    init(id: Int, name: String, status: CharacterStatus, species: String, type: String?, gender: String, origin: String, location: String, image: String, episode: [String]) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender.capitalized
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
    }
    
    static let mock: Character = .init(
        id: 1,
        name: "Rick Sánchez",
        status: .alive,
        species: "Human",
        type: nil,
        gender: "Male",
        origin: "Earth (C-137)",
        location: "Citadel of Ricks",
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: []
    )
}
