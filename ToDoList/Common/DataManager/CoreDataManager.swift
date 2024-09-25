//
//  CoreDataManager.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 23.09.2024
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    private var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CoreDataManager {
    func createEntity<T: NSManagedObject>(_ type: T.Type, configure: (T) -> Void) -> T {
        let entityName = String(describing: type)
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: viewContext) as! T
        configure(entity)
        saveContext()
        
        return entity
    }
    
    func fetchEntities<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch entities: \(error)")
            
            return []
        }
    }
    
    func updateEntity<T: NSManagedObject>(_ entity: T, configure: (T) -> Void) {
        configure(entity)
        saveContext()
    }
    
    func deleteEntity(_ entity: NSManagedObject) {
        viewContext.delete(entity)
        saveContext()
    }
}
