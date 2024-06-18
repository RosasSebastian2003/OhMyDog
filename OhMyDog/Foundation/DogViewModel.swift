//
//  DogViewModel.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/18/24.
//

import Foundation

@Observable
final class DogViewModel {
    
    var dogs = [Dog]()
    var selectedDog: Dog?
    
    init() {
        dogs = loadDogsfromJSON() ?? []
    }
    
    func loadDogsfromJSON() -> [Dog]? {
        var data: Data
        
        guard let url = Bundle.main.url(forResource: "dog", withExtension: ".json")
        else {
            
            fatalError("Archivo no encontrado")
        }
        
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("No se puede cargar el archivo, \(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Dog].self, from: data)
        } catch {
            fatalError("No es posible parsear el archivo, \(error)")
        }
        
    }
    
    func selectDogWithId(id: Int) -> Dog? {
        return dogs.first { $0.id == id }
    }
    
    func setSelectedDog(selectedDog: Dog) {
        self.selectedDog = selectedDog
    }
}
