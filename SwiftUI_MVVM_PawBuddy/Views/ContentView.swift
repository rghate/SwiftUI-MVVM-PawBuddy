//
//  ContentView.swift
//  SwiftUI_MVVM_PawBuddy
//
//  Created by Rupali on 30/06/2020.
//  Copyright © 2020 rghate. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var dogsVM = DogViewModel.instance
    @FetchRequest(entity: DogEntity.entity(), sortDescriptors: [])  var dogs: FetchedResults<DogEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dogs, id: \.id) { dog in
                    ListRowView(name: dog.name ?? "Unknown", breed: dog.breed, gender: dog.gender, pictureData: dog.pictureData as? Data)
                }
                .onDelete(perform: delete)  //delete row on left-swipe
                .frame(height: 70)
            }
            .navigationBarTitle("Paw Buddy")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                NavigationLink(destination: NewDogView(didAddDog: { dog  in
                    self.add(dog: dog)
                }), label: {
                    Image(systemName: "plus").foregroundColor(.black)
                })
            }))
        }.navigationBarTitle("", displayMode: .inline)
    }
    
    private func add(dog: Dog) {
        do {
            // this will update the dog array in viewmodel(an observable obj), which will update the List UI.
            try self.dogsVM.add(dog: dog, context: self.moc)
        } catch {
            print("Error while adding new entry: ", error)
        }
    }
    
    // Delete row from db
    private func delete(at indexSet: IndexSet) {
         for index in indexSet {
            let dog = dogs[index]
            moc.delete(dog)
        }
        try? moc.save()
        
        dogsVM.delete(atOffsets: indexSet, context: moc)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
