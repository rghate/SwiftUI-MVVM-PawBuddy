//
//  NewDogForm.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct NewDogView: View {
    
    var didAddDog: (_ dog: Dog) -> ()

    @State var name: String = ""
    
    @State var breed: String = ""
    
    @State var gender: String = ""
    
    @State var thumbnail: String?
    
    @State var isShowingImagePicker    = false
    
    @State var displayedImage = UIImage(named: "dog_logo") ?? UIImage()
    
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
            VStack(alignment: .center, spacing: -35) {
                Image(uiImage: displayedImage)
                    .resizable()
                    .clipped()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    
                    .gesture(TapGesture().onEnded({
                        self.isShowingImagePicker.toggle()
                    }))
                    .sheet(isPresented: self.$isShowingImagePicker) {
                        ImagePickerView(isPresented: self.$isShowingImagePicker, selectedPickerImage: self.$displayedImage)
                }
                Text("Edit").padding(.leading, 35).padding(.trailing, 35).padding(.bottom, 15).padding(.top, 5)
                    .background(Color(UIColor(white: 0.6, alpha: 0.8)))
                    .foregroundColor(.white)
                    .clipped()  // TODO: combine image and textview into a combined custom view
                
                
            }.overlay(
                //                RoundedRectangle(cornerRadius: 50.0)
                Circle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 0.5))
                    .foregroundColor(.init(white: 0.5)))
                .clipShape(Circle())
            
            
            Group {
                TextField("Name", text: $name)
                TextField("Breed", text: $breed)
                TextField("Gender", text: $gender)
            }.padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 1)
            
            Button(action: {
                print("button Action")

                guard let dog = self.addDog() else { return }
                
                self.didAddDog(dog)

                self.presentationMode.wrappedValue.dismiss()
            
            }) {
                Text("Add")
            }
            .frame(width: 200, height: 50)
            .background(name.count > 0 && breed.count > 0 && gender.count > 0 ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(5)
            .font(.system(size: 24))
            .disabled(name.count > 0 && breed.count > 0  && gender.count > 0 ? false : true)
            
            Spacer()
            
        }.padding(40)
            //            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
    
    func addDog() -> Dog? {
        if name.count > 0 &&
        breed.count > 0 &&
            gender.count > 0 {
            return Dog(name: name, breed: breed, gender: gender, thumbnail: thumbnail)
        } else {
            return nil
        }
        
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewDogView(didAddDog: { dog in
            
        }, name: "Test preview name", breed: "Golden", gender: "Female", thumbnail: nil)
    }
}
