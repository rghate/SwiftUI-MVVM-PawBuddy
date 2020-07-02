//
//  DogViewModel.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import Foundation

class DogViewModel: ObservableObject {
    
    @Published var dogs: [Dog] = [Dog(name: "Bella", breed: "Shih Tzu", gender: "Female", pictureData: nil),
                                  Dog(name: "Coco", breed: "Labradore", gender: "Male", pictureData: nil),
                                  Dog(name: "Cuddles", breed: "Golden Retriever", gender: "Male", pictureData: nil)
    ]
    
    func addDog(dog: Dog) {
        self.dogs.append(dog)
    }
}
