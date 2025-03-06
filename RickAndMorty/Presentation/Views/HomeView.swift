//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 6/3/25.
//

import SwiftUI

struct HomeView: View {
    enum Constants {
        static let placeholder: String = "Search character..."
        static let title: String = "Rick & Morty"
    }
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.displayedCharacters, id: \.id) { character in
                    NavigationLink(destination: DetailView(character: character)) {
                        CharacterRow(character: character)
                    }
                    .onAppear {
                        if viewModel.shouldLoadNextPage(character: character) {
                            Task {
                                await viewModel.fetchCharacters(isSearch: !viewModel.searchText.isEmpty)
                            }
                        }
                    }
                }

                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .listStyle(.grouped)
            .navigationTitle(Constants.title)
            .searchable(text: $viewModel.searchText, prompt: Constants.placeholder)
            .task {
                await viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    HomeView()
}

