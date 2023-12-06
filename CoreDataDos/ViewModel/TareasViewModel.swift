//
//  TareasViewModel.swift
//  CoreDataDos
//
//  Created by Alondra García Morales on 05/12/23.
//

import Foundation
import CoreData
class TareasViewModel: ObservableObject{
    @Published var tarea = ""
    
    
    func saveData(context: NSManagedObjectContext, meta:Metas){
        let newTarea = Tareas(context: context)
        newTarea.tarea = tarea
        newTarea.id = UUID().uuidString
        newTarea.idMeta = meta.id
        
        meta.mutableSetValue(forKey: "relationToTareas").add(newTarea)
        do{
            try context.save()
            print("Guardo")
        } catch let error as NSError{
            print("No guardo", error.localizedDescription)
        }
    }
}
