//
//  DetalleTareaView.swift
//  Unidad4Tareas
//
//  Created by Celia Rascón García on 23/2/25.
//

import Foundation
import SwiftUI

struct DetalleTareaView: View {
    let tarea: String

    var body: some View {
        VStack {
            Text("Detalles de la tarea")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text(tarea)
                .font(.headline)
                .padding()

            Spacer()
        }
        .navigationTitle("Detalles")
    }
}




