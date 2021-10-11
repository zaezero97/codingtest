//
//  Folder+CoreDataProperties.swift
//  
//
//  Created by 재영신 on 2021. 10. 8..
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var child_fds: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var newRelationship: NSSet?

}

// MARK: Generated accessors for newRelationship
extension Folder {

    @objc(addNewRelationshipObject:)
    @NSManaged public func addToNewRelationship(_ value: Memo)

    @objc(removeNewRelationshipObject:)
    @NSManaged public func removeFromNewRelationship(_ value: Memo)

    @objc(addNewRelationship:)
    @NSManaged public func addToNewRelationship(_ values: NSSet)

    @objc(removeNewRelationship:)
    @NSManaged public func removeFromNewRelationship(_ values: NSSet)

}

extension Folder : Identifiable {

}
