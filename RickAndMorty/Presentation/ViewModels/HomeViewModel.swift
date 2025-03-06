//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 6/3/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    private var characterUseCases: CharacterUseCasesProtocol
    private var nextPage: Int? = 1
    
    @Published var characters: [Character] = []
    @Published var filteredCharacters: [Character] = []
    @Published var isLoading = false
    @Published var searchText: String = "" {
        didSet {
            Task {
                await fetchCharacters(isSearch: !searchText.isEmpty, reset: true)
            }
        }
    }

    init(characterUseCases: CharacterUseCasesProtocol = CharacterUseCases()) {
        self.characterUseCases = characterUseCases
    }

    @MainActor
    func fetchCharacters(isSearch: Bool = false, reset: Bool = false) async {
        guard !isLoading else { return }

        isLoading = true
        if reset {
            if isSearch {
                filteredCharacters.removeAll()
            } else {
                characters.removeAll()
            }
            nextPage = 1
        }

        do {
            let (newCharacters, nextPage) = try await characterUseCases.fetchCharacters(page: nextPage ?? 1, name: isSearch ? searchText : nil)

            if isSearch {
                let uniqueFilteredCharacters = newCharacters.filter { newCharacter in
                    !filteredCharacters.contains(where: { $0.id == newCharacter.id })
                }
                self.filteredCharacters.append(contentsOf: uniqueFilteredCharacters)
            } else {
                let uniqueCharacters = newCharacters.filter { newCharacter in
                    !characters.contains(where: { $0.id == newCharacter.id })
                }
                self.characters.append(contentsOf: uniqueCharacters)
            }

            self.nextPage = nextPage
        } catch {
            print("Error fetching characters: \(error)")
        }
        
        isLoading = false
    }

    func shouldLoadNextPage(character: Character?) -> Bool {
        guard let character = character else { return false }

        let thresholdIndex = max(.zero, displayedCharacters.count - 5)
        return displayedCharacters.firstIndex(where: { $0.id == character.id }) == thresholdIndex
    }

    var displayedCharacters: [Character] {
        searchText.isEmpty ? characters : filteredCharacters
    }
}
