//
//  DogView.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/17/24.
//

import SwiftUI
import RealityKit

struct DogVolumeView: View {
    
    @State private var angle: Angle = .degrees(0)
    @Environment(DogViewModel.self) var viewModel
    
    var body: some View {
    
        VStack(spacing: 18.0) {
            Model3D(named: viewModel.selectedDog?.breed ?? "germanShepherd") { model in
                switch model {
                case .empty:
                    ProgressView()
                    
                case .success(let resolvedModel3D):
                    resolvedModel3D
                        .rotation3DEffect(angle, axis: .x)
                        .rotation3DEffect(angle, axis: .y)
                        .animation(.linear(duration: 10).repeatForever(), value: angle)
                        .onAppear {
                            angle = .degrees(359)
                        }
                        
                case .failure(let error):
                    Text(error.localizedDescription)
                    
                @unknown default:
                    EmptyView()
                }
            }
        }
        
    }
}

#Preview {
    DogVolumeView()
}
