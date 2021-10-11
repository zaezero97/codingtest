//
//  Memo+CoreDataProperties.swift
//  
//
//  Created by 재영신 on 2021. 10. 10..
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: Int16
    @NSManaged public var subtitle: String?
    @NSManaged public var time: Date?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var newRelationship: Folder?

}

extension Memo : Identifiable {

}
