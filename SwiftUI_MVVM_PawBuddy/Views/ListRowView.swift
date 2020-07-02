//
//  ListRowView.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 02/07/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
    @State var dog: Dog
    
    var body: some View {
        HStack(spacing: 10) {
            (dog.pictureData?.getPicture() ?? Image(defaultDogImage))
                .resizable()
                .clipped()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 50.0)
                        .strokeBorder(style: StrokeStyle(lineWidth: 0.5))
                        .foregroundColor(.init(white: 0.5)))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(dog.name)
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                Text(dog.breed)
            }
            
            Spacer()
            Text(dog.gender)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(dog: Dog(name: "Test name", breed: "Test Breed", gender: "Male", pictureData: nil))
    }
}
