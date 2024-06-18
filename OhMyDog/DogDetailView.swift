//
//  DogDetailView.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/18/24.
//

import SwiftUI

struct DogDetailView: View {
    @Binding var selectedDog: Dog?
    
    @State private var volumeIsSHowing: Bool = false
    @Environment(DogViewModel.self) var dogViewModel
    
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack {
            Text(selectedDog?.breed ?? "Not Found")
                .font(.extraLargeTitle2)
            
            Text(selectedDog?.description ?? "Not Found")
                .multilineTextAlignment(.leading)
            
           
            Toggle("Ver Perro", isOn: $volumeIsSHowing)
                .toggleStyle(.button)
                .onChange(of: self.volumeIsSHowing) { oldValue, newValue in
                    if newValue {
                        dogViewModel.setSelectedDog(selectedDog: selectedDog ?? Dog(id: 1, breed: "Pug", description: "Description"))
                        
                        openWindow(id: "volumeView")
                    }
                    else {
                        dismissWindow(id: "volumeView")
                    }
                }
                .padding(.vertical, 50)
            
            Spacer()
            
        }
        .padding()
        
        
    }
}

#Preview {
    DogDetailView(selectedDog: .constant(Dog(id: 1, breed: "Pug", description: "Funny dog")))
}
