//
//  ListRowView.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 02/07/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
    var name: String
    var breed: String?
    var gender: String?
    var pictureData: Data?
    
    var body: some View {
        HStack(spacing: 10) {
            ((pictureData)?.getPicture() ?? Image(defaultDogImage))
                .resizable()
                .clipped()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 50.0)
                        .strokeBorder(style: StrokeStyle(lineWidth: 0.5))
                        .foregroundColor(.white))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name )
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                Text(breed ?? "")
            }
            
            Spacer()
            Text(gender ?? "")
        }
    }
}
//
//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
////        ListRowView(dog: Dog(name: "Test name", breed: "Test Breed", gender: "Male", pictureData: nil))
//    }
//}
