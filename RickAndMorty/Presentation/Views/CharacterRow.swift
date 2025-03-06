//
//  CharacterRow.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 6/3/25.
//

import SwiftUI

struct CharacterRow: View {
    enum Constants {
        static let imageSize: CGFloat = 50
        static let placeholderImage = "placeholder_image"
    }
    
    let character: Character
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Constants.imageSize, height: Constants.imageSize)
                        .clipShape(Circle())
                } else if phase.error != nil {
                    Image(Constants.placeholderImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Constants.imageSize, height: Constants.imageSize)
                        .clipShape(Circle())
                } else {
                    ProgressView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text(character.status)
                    .font(.subheadline)
                    .foregroundColor(character.status == "Alive" ? .green : .red)
            }
        }
    }
}
