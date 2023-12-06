//
//  AddMetaView.swift
//  CoreDataDos
//
//  Created by Alondra García Morales on 05/12/23.
//

import SwiftUI

struct AddMetaView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var model = MetasViewModel()
    var body: some View {
        VStack{
            TextField("Titulo", text: $model.titulo).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Description", text: $model.desc).textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action:{
                model.saveData(context: context)
            }){
                Text("Guardar")
            }
            Spacer()
        }.padding()
    }
}
