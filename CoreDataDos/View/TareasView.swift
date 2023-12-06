//
//  TareasView.swift
//  CoreDataDos
//
//  Created by Alondra García Morales on 05/12/23.
//

import SwiftUI

struct TareasView: View {
    @Environment(\.managedObjectContext) var context
    //@FetchRequest(entity: Tareas.entity(), sortDescriptors: []) var tareas : FetchedResults<Tareas>
    
    var meta : Metas
    var tareas : FetchRequest<Tareas>
    init(meta: Metas){
        self.meta = meta
        tareas = FetchRequest<Tareas>(entity: Tareas.entity(), sortDescriptors: [], predicate: NSPredicate(format: "idMeta == %@",  meta.id!))
    }
    var body: some View {
            VStack{
                List{
                    ForEach(tareas.wrappedValue){tarea in
                    
                        NavigationLink(destination: FotoView(tarea: tarea)){
                            VStack(alignment: .leading){
                                Text(tarea.tarea ?? "").font(.title)
                            }
                        }
                        
                    }
                }
                NavigationLink(destination: AddTareasView(meta: meta)){
                    Image(systemName: "plus")
                }.navigationBarTitle(meta.titulo ?? "")
            }
        
    }
}

