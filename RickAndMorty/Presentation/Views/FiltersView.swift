//
//  FiltersView.swift
//  RickAndMorty
//
//  Created by Alex Hernández on 7/3/25.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(CharacterStatus.allCases) { status in
                    Button(action: {
                        viewModel.selectedStatus = status
                    }) {
                        Text(status.rawValue.capitalized)
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(viewModel.selectedStatus == status ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(viewModel.selectedStatus == status ? .white : .black)
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    FiltersView(viewModel: HomeViewModel())
}
