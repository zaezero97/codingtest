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
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    var entityName : String!
    
    func addMemo(title : String, time: Date, subTitle: String?, content: String,type:String,id: Int16){
        entityName = "Memo"
        guard let context = context, let entity : NSEntityDescription = NSEntityDescription.entity(forEntityName: entityName, in: context) else{
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
}
