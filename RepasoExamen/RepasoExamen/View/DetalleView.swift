//
//  DetalleView.swift
//  RepasoExamen
//
//  Created by Celia Rascón García on 27/2/25.
//

import SwiftUI

struct DetalleView: View {
    var id: Int 

    @StateObject var user = DetalleViewModel()
    
    var body: some View {
        VStack {
            if user.avatar.isEmpty {
                ProgressView()
            } else {
                AsyncImage(url: URL(string: user.avatar)!){ image in
                    image
                        .resizable()
                        .frame(width: 130, height: 130)
                        .clipped()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                Text(user.first_name)
                    .font(.largeTitle)
                Text(user.email)
                    .font(.title)
            }
            
        }.onAppear {
            user.fetch(id: id)
        }
    }
}
