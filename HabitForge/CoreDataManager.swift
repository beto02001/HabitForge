//
//  CoreDataManager.swift
//  HabitForge
//
//  Created by Luis Humberto Martinez Echegaray on 08/10/25.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        var container = NSPersistentContainer(name: "HabitForge")
        container.loadPersistentStores { persistentStore, error in
            guard error == nil else {
                print("Error loading store \(persistentStore) — \(String(describing: error))")
                return
            }
        }
        print("success create persistance container")
        return container
    }()
    
    enum HabitPredicate {
        case all
        case byCategory(String)
        case byTitle(String)
        case byColor(Int16)
        case byDate(Date)
        case byID(UUID)
        
        var predicate: NSPredicate {
            switch self {
            case .all:
                return NSPredicate(value: true)
            case .byCategory(let category):
                return NSPredicate(format: "category == %@", category)
            case .byTitle(let title):
                return NSPredicate(format: "title CONTAINS[cd] %@", title)
            case .byColor(let color):
                return NSPredicate(format: "color == %d", color)
            case .byDate(let date):
                return NSPredicate(format: "createdAt == %@", date as NSDate)
            case .byID(let id):
                return NSPredicate(format: "id == %@", id as NSUUID)
            }
        }
    }
    
    public init() { }

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
    
    public func saveHabit(from data: HabitViewModel, completion: @escaping (Result<Habit, Error>) -> Void) {
        let context = persistentContainer.viewContext
        let habit = Habit(context: context)
        
        habit.id = data.id
        habit.title = data.title
        habit.category = data.category
        habit.color = data.colorTag
        habit.createdAt = data.createdAt
        habit.reminderTime = data.reminderTime
        
        do {
            try context.save()
            completion(.success(habit))
        } catch {
            context.rollback()
            completion(.failure(error))
        }
    }
    
    public func fetchHabit(predicate: HabitPredicate = .all, completion: @escaping (Result<[HabitViewModel], Error>) -> Void) {
        let request: NSFetchRequest<Habit> = Habit.fetchRequest()
        request.predicate = predicate.predicate
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            let habits: [HabitViewModel] = result.map { HabitViewModel(from: $0) }
            completion(.success(habits))
        } catch {
            completion(.failure(error))
        }
    }
    
    public func findHabit(predicate: HabitPredicate) -> Habit {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<Habit> = Habit.fetchRequest()
        request.predicate = predicate.predicate
        request.fetchLimit = 1
        
        let habit = try? context.fetch(request).first
        return habit ?? Habit()
    }
    
    public func setDetailHabit(from data: HabitViewModel) {
        let context = persistentContainer.viewContext
        var habit = findHabit(predicate: .byID(data.id))
        let detail = HabitDetail(context: context)
        
        detail.id = UUID()
        detail.date = Date()
        detail.isComplete = true
        
        habit.addToHabitToDetail(detail)
        
        print("detalle añadido: ", habit)
        do {
            try context.save()
        } catch {
            context.rollback()
        }
    }

}
