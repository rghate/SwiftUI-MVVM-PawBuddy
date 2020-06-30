//
//  NewDogForm.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct NewDogView: View {
    @State var name: String = ""
    
    @State var breed: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    //custom back button
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
//                Text("Go back")
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Image("dog_logo")
                .resizable()
                .clipped()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 50.0)
                        .strokeBorder(style: StrokeStyle(lineWidth: 0.5))
                        .foregroundColor(.init(white: 0.5)))
            
            Group {
                TextField("Name", text: $name)
                TextField("Breed", text: $breed)
            }.padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 1)
            
            Button(action: {
                print("button Action")
                let result = self.addDog()
                if result {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Add")
            }
            .frame(width: 200, height: 50)
            .background(name.count > 0 && breed.count > 0 ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(5)
            .font(.system(size: 24))
            .disabled(name.count > 0 && breed.count > 0 ? false : true)
            
            Spacer()
            
        }.padding()
//            .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    func addDog() -> Bool {
        return (name.count > 0 && breed.count > 0) ? true : false
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewDogView(name: "Test preview name", breed: "Golden")
    }
}
