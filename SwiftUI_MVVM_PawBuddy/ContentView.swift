//
//  ContentView.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var dogsVM = DogViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(dogsVM.dogs) { dog in
                    Text(dog.name)
                }
            }
            .navigationBarTitle("Paw Buddy")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                NavigationLink(destination: NewDogView()) {
                    Text("Add New Dog")
                }
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
