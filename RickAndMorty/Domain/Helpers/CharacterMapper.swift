//
//  CharacterMapper.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 6/3/25.
//

import Foundation

class CharacterMapper {
    func map(characters: [CharacterDTO]) -> [Character] {
        return characters.map(\.self).toDomain()
    }
}
