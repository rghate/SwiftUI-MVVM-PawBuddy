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
                    ListRowView(dog: dog)
                }
                .onDelete(perform: delete)
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
    
    func delete(at offset: IndexSet) {
        dogsVM.dogs.remove(atOffsets: offset)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
