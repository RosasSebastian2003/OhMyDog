//
//  ContentView.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/17/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            DogSelectionView()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
