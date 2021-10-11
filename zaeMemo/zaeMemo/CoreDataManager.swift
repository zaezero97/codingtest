//
//  CoreDataManager.swift
//  zaeMemo
//
//  Created by 재영신 on 2021/10/07.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager{
    static let shared : CoreDataManager = CoreDataManager() //singleton pattern / lazy property,,,m,
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
   
    
    func saveMemo(title : String, time: Date, subTitle: String?, content: String,type:String,id: Int16){
        guard let context = self.context, let entity : NSEntityDescription = NSEntityDescription.entity(forEntityName: "Memo", in: context) else{
            return
        }
        if let memo : Memo = NSManagedObject(entity: entity, insertInto: context) as? Memo{
            memo.id = id
            memo.content = content
            memo.title = title
            memo.subtitle = subTitle
            memo.type = type
            memo.time = time
            
            do{
                try context.save()
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    func loadAllMemo<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        guard let context = self.context else { return [] }
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    func loadMemo<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        guard let context = self.context else { return [] }
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    func deleteMemo<T: NSManagedObject>(at id: Int, request: NSFetchRequest<T>) -> Bool {
        request.predicate = NSPredicate(format: "id = %@",NSNumber(value: id))
        do {
            if let recentTerms = try context?.fetch(request) {
                if recentTerms.count == 0 { return false }
                context?.delete(recentTerms[0])
                try context?.save()
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }

        return false
    }
}
