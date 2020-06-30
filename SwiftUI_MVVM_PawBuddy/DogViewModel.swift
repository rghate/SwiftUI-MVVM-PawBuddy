//
//  DogViewModel.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import Foundation

struct DogViewModel {
    
    var dogs: [Dog] = [Dog(name: "Bella", breed: "Shih Tzu", gender: "Female", thumbnail: "bella"),
                                  Dog(name: "Coco", breed: "Labradore", gender: "Male", thumbnail: "coco"),
                                  Dog(name: "Cuddles", breed: "Golden Retriever", gender: "Male", thumbnail: "cuddles")
    ]
    
    func addDog() {
        
    }
}
