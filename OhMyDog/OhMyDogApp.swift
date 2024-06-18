//
//  OhMyDogApp.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/17/24.
//

import SwiftUI

@main
struct OhMyDogApp: App {
    @State private var dogViewModel = DogViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dogViewModel)
        }
        
        WindowGroup(id: "volumeView") {
            DogVolumeView()
                .environment(dogViewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 1, depth: 1, in: .meters)
    }
}
