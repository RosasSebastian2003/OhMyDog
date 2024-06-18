//
//  DogSelectionView.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/18/24.
//

import SwiftUI

struct DogSelectionView: View {
    @Environment(DogViewModel.self) var dogViewModel

    @State private var dogIds: Set<Dog.ID> = []
    
    var body: some View {
        NavigationSplitView {
            List(dogViewModel.dogs, selection: $dogIds) { dog in
                
                Text(dog.breed)
            }
        } detail: {
            ForEach(Array(dogIds), id: \.self) { dogId in
                if let dog = dogViewModel.dogs.first(where: { $0.id == dogId }) {
                    
                    DogDetailView(selectedDog: .constant(dog))
                } else {
                    Text("Dog not found")
                }
            }
        }
    }
}

#Preview {
    DogSelectionView()
}
