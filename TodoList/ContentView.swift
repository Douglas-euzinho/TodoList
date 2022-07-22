//
//  ContentView.swift
//  TodoList
//
//  Created by Victor Brito on 18/07/22.
//

import SwiftUI
import CoreData

import SwiftUI
import CoreData

struct ContentView: View {
    @State var items = PersistenceController.shared.fetchFoods()
    var body: some View {
        VStack {
            Text("Lista")
            NavigationView {
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Image("hamburguer")
                                .accessibilityIdentifier("imagem")
                                
                        } label: {
                            Text("Comida")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                Text("Select an item")
            }
        }
    }

    func addItem() {
        withAnimation {
            let _ = PersistenceController.shared.createFood(name: "Pastel", type: "Gordura")
            items = PersistenceController.shared.fetchFoods()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach { foods in
                PersistenceController.shared.delete(object: foods)
                items = PersistenceController.shared.fetchFoods()
            }
        }
    }
}

private let itemFormatter: String = {
    let formatter = String()
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
