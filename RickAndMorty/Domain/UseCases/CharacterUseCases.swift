//
//  CharacterUseCases.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 6/3/25.
//

import Foundation

protocol CharacterUseCasesProtocol {
    func fetchCharacters(page: Int, name: String?) async throws -> ([Character], nextPage: Int?)
    func fetchCharacter(id: Int) async throws -> Character
}

class CharacterUseCases: CharacterUseCasesProtocol {
    var apiRepository: APIRepositoryProtocol
    var characterMapper: CharacterMapper
    
    init(apiRepository: APIRepositoryProtocol = APIRepository(),
         characterMapper: CharacterMapper = CharacterMapper()) {
        self.apiRepository = apiRepository
        self.characterMapper = characterMapper
    }
    
    func fetchCharacters(page: Int, name: String?) async throws -> ([Character], nextPage: Int?) {
        let result = try await apiRepository.fetchCharacters(page: page, name: name)
        let charactersDomain = characterMapper.map(characters: result.0)
        let nextPage = result.1
        return (charactersDomain, nextPage)
    }
    
    func fetchCharacter(id: Int) async throws -> Character {
        return try await apiRepository.fetchCharacter(id: id).toDomain()
    }
}

