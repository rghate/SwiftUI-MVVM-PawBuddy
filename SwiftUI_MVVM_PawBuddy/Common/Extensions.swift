//
//  Extensions.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 02/07/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

extension Data {
    
    func getPicture() -> Image? {
        var picture: Image?
        if let uiImage = UIImage(data: self) {
            picture = Image(uiImage: uiImage)
        }
        return picture
    }
}
 
