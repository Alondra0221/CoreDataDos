//
//  Home.swift
//  CoreDataDos
//
//  Created by Alondra García Morales on 05/12/23.
//

import SwiftUI
import CoreData


struct Home: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Metas.entity(), sortDescriptors: []) var metas : FetchedResults<Metas>
    @ObservedObject var model = MetasViewModel()
    @State private var buscar = ""
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $buscar)
                List{
                    ForEach(metas.filter{
                        buscar.isEmpty ? true : $0.titulo!.lowercased().contains(buscar.lowercased())
                    }){meta in
                        NavigationLink(destination: TareasView(meta: meta)){
                            VStack(alignment: .leading){
                                Text(meta.titulo ?? "").font(.title)
                                Text(meta.desc ?? "").font(.headline)
                            }
                        }
                    }.onDelete{ (IndexSet) in
                        let borrarMeta = metas[IndexSet.first!]
                        model.deleteData(item: borrarMeta, context: context)
                    }
                }
                NavigationLink(destination: AddMetaView()){
                    Image(systemName: "note")
                }.navigationBarTitle("Metas")
            }
        }
    }
}
