//
//  TitleView.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/18/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct TitleView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Bienvenido al Sistema Solar!")
                    .font(.extraLargeTitle2)
                
                
                Model3D(named: "dogs", bundle: realityKitContentBundle)
                    .padding(.vertical, 75)
                
                
                NavigationLink(destination: EmptyView()) {
                    Text("Ver Planetas")
                        .font(.extraLargeTitle)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TitleView()
}
