//
//  DogViewModel.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI
import CoreData
class DogViewModel: ObservableObject {
    
    static let instance = DogViewModel()
        
    @Published var dogs = [Dog]()
    
    private init() {}
    
    func add(dog: Dog, context: NSManagedObjectContext) throws {
        let entity = DogEntity(context: context)
        entity.id = UUID()
        entity.name = dog.name
        entity.breed = dog.breed
        entity.gender = dog.gender
        
        entity.pictureData = dog.pictureData as NSData?
        
        if context.hasChanges {
            try context.save()
        }
        self.dogs.append(dog)
    }
    
    func delete(atOffsets indexSet: IndexSet, context: NSManagedObjectContext) {
        dogs.remove(atOffsets: indexSet)
    }

}
