//
//  Dog.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import Foundation

struct Dog: Identifiable {
    var id = UUID()
    
    let name: String
    let breed: String
    let gender: String
    let thumbnail: String
}
