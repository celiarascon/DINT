//
//  ContentView.swift
//  CoreDataSwiftUI
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)]
    ) var items: FetchedResults<Item>

    @State private var newItemName: String = ""
    @State private var isEditing: Bool = false
    @State private var editingItem: Item? = nil
    @State private var showRecentItems: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                TextField("Nuevo elemento", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack {
                    Button(action: addItem) {
                        Text("Agregar")
                    }
                    .disabled(newItemName.isEmpty)

                    Button(action: {
                        showRecentItems.toggle()
                    }) {
                        Text(showRecentItems ? "Mostrar antiguos" : "Mostrar recientes")
                    }
                }

                List {
                    ForEach(filteredItems, id: \.self) { item in
                        HStack {
                            Text(item.name ?? "Sin nombre")
                            Spacer()
                            Text("Creado: \(item.timestamp!, formatter: itemFormatter)")
                            Button(action: {
                                editingItem = item
                                newItemName = item.name ?? ""
                                isEditing = true
                            }) {
                                Image(systemName: "pencil")
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Lista de elementos")
            .toolbar {
                EditButton()
            }
            .sheet(isPresented: $isEditing) {
                if let item = editingItem {
                    EditItemView(item: item, name: $newItemName, isPresented: $isEditing)
                        .environment(\.managedObjectContext, viewContext)
                }
            }
        }
    }

    private var filteredItems: [Item] {
        if showRecentItems {
            return Array(items.prefix(10)) // Mostrar los 10 más recientes
        } else {
            return Array(items.suffix(10)) // Mostrar los 10 más antiguos
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.name = newItemName
            newItem.timestamp = Date()

            do {
                try viewContext.save()
                newItemName = ""
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct EditItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    var item: Item
    @Binding var name: String
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                TextField("Editar elemento", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: saveItem) {
                    Text("Guardar")
                }
                .disabled(name.isEmpty)
            }
            .navigationTitle("Editar elemento")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        isPresented = false
                    }
                }
            }
        }
    }

    private func saveItem() {
        withAnimation {
            item.name = name
            item.timestamp = Date()

            do {
                try viewContext.save()
                isPresented = false
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
