//
//  ContentView.swift
//  Unidad4Tareas
//
//  Created by Celia Rascón García on 23/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tareas: [String] = ["Tarea 1", "Tarea 2", "Tarea 3", "Tarea 4"]
    @State private var nuevaTarea: String = ""

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Text("LISTA DE TAREAS")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()

                    List {
                        ForEach(tareas, id: \.self) { tarea in
                            HStack {
                                Text(tarea)
                                Spacer()

                                // Botón para ver detalles
                                NavigationLink(destination: DetalleTareaView(tarea: tarea)) {
                                    Text("Ver detalles")
                                        .padding(8)
                                        .background(Color.blue)
                                        .cornerRadius(5)
                                        .foregroundColor(.white)
                                }

                                // Botón para eliminar tarea
                                Button(action: { eliminarTarea(tarea) }) {
                                    Text("Eliminar")
                                        .padding(8)
                                        .background(Color.red.opacity(0.8))
                                        .cornerRadius(5)
                                        .foregroundColor(.white)
                                }
                                .buttonStyle(PlainButtonStyle()) 
                            }
                        }
                    }

                    HStack {
                        TextField("Agregar nueva tarea...", text: $nuevaTarea)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Button(action: { agregarTarea() }) {
                            Text("Añadir")
                                .padding(8)
                                .background(Color.green)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
            }
            .tabItem {
                Label("Tareas", systemImage: "list.bullet")
            }

            Text("Recordatorios (En desarrollo)")
                .tabItem {
                    Label("Recordatorios", systemImage: "square.grid.2x2")
                }
        }
    }

    func agregarTarea() {
        if !nuevaTarea.isEmpty {
            tareas.append(nuevaTarea)
            nuevaTarea = ""
        }
    }

    func eliminarTarea(_ tarea: String) {
        tareas.removeAll { $0 == tarea }
    }
}
#Preview {
    ContentView()
}
