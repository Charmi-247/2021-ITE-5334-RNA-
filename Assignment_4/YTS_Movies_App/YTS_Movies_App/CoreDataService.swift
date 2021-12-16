//
//  CoreDataService.swift
//  YTS_Movies_App
//
//  Created by user202363 on 12/15/21.
//

import Foundation
import CoreData

class CoreDataService{
    
    static var shared : CoreDataService = CoreDataService();
    
    func insertNewFeedback(overall: String, detail: String){
        let newTask = Feedback(context: persistentContainer.viewContext)
        newTask.overall = overall
        newTask.detail = detail
        saveContext()
    }
    
    func getAllFeedback() -> [Feedback]{
        
        var result = [Feedback]()
        let fetch: NSFetchRequest = Feedback.fetchRequest()
        
        do{
            result = try persistentContainer.viewContext.fetch(fetch)
        }catch{}
        
        return result
    }
    
    func deleteOneFeedback(todelete: Feedback){
        persistentContainer.viewContext.delete(todelete)
        saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YTS_Movies_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
