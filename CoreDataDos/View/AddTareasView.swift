//
//  AddTareasView.swift
//  CoreDataDos
//
//  Created by Alondra García Morales on 05/12/23.
//

import SwiftUI

struct AddTareasView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var model = TareasViewModel()
    var meta : Metas
    var body: some View {
        VStack{
            TextField("Tarea", text: $model.tarea).textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action:{
                model.saveData(context: context, meta: meta)
            }){
                Text("Guardar")
            }
        }.padding()
    }
}

