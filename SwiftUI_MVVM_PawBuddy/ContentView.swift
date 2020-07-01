//
//  ContentView.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dogsVM = DogViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dogsVM.dogs) { dog in
                    HStack(spacing: 10) {
                        Image(dog.thumbnail ?? "dog_logo")
                            .resizable()
                            .clipped()
                            .scaledToFit()
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
                .frame(height: 70)
            }
            .navigationBarTitle("Paw Buddy")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                NavigationLink(destination: NewDogView(didAddDog: { dog  in
                    self.dogsVM.addDog(dog: dog) // this will update the dog array in viewmodel( an observable obj), which will update the List UI.
                }), label: {
                    Image(systemName: "plus").foregroundColor(.black)
                })
            }))
        }.navigationBarTitle("", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
