//
//  CharacterRepositoryData.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 5/3/25.
//

import Foundation

protocol APIRepositoryProtocol {
    func fetchCharacters(page: Int, name: String?) async throws -> ([CharacterDTO], nextPage: Int?)
    func fetchCharacter(id: Int) async throws -> CharacterDTO
}

class APIRepository: APIRepositoryProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters(page: Int, name: String?) async throws -> ([CharacterDTO], nextPage: Int?) {
        var url = APIEndpoints.Character.list(page: page)
        
        if let name = name, !name.isEmpty {
            let queryName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            url += "&name=\(queryName)"
        }
        
        let response: CharacterListDTO = try await apiClient.fetch(url: url)
        
        guard let nextPageURLString = response.info.next,
              let nextPageURL = URL(string: nextPageURLString),
              let components = URLComponents(url: nextPageURL, resolvingAgainstBaseURL: true),
              let nextPageValue = components.queryItems?.first(where: { $0.name == "page" })?.value,
              let nextPageNumber = Int(nextPageValue) else {
            return (response.results, nil)
        }
        
        return (response.results, nextPageNumber)
    }
    
    func fetchCharacter(id: Int) async throws -> CharacterDTO {
        try await apiClient.fetch(url: APIEndpoints.Character.detail(id: id))
    }
}
