//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 6/3/25.
//

import SwiftUI

struct DetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text(character.name)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Location: \(character.location)")
                .font(.title2)
            
            Text("Gender: \(character.gender)")
                .font(.title2)
            
            Text("Species: \(character.species)")
                .font(.title2)
            
            Text("Origin: \(character.origin)")
                .font(.title2)
            
            Text("Status: \(character.status.rawValue.capitalized)")
                .font(.title2)
                .foregroundColor(character.status == .alive ? .green : .red)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    DetailView(character: Character.mock)
}
