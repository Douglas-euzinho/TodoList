//
//  Persistence.swift
//  TodoList
//
//  Created by Douglas Figueirôa on 18/07/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TodoList")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func createFood(name: String, type: String) -> Food {
        let food = Food(context: container.viewContext)
        food.name = name
        food.type = type
        save()
        return food
    }
    
    func updateFood(food: Food, name: String, type: String) -> Food {
        food.name = name
        food.type = type
        save()
        return food
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetchFoods() -> [Food] {
        do {
            return try container.viewContext.fetch(Food.fetchRequest())
        } catch {
            return []
        }
    }
    
    func delete(object: NSManagedObject) {
        container.viewContext.delete(object)
        save()
    }
}
