//
//  Account+CoreDataProperties.swift
//  
//
//  Created by Parag Dulam on 30/11/17.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var email: String?
    @NSManaged public var files: NSSet?

}

// MARK: Generated accessors for files
extension Account {

    @objc(addFilesObject:)
    @NSManaged public func addToFiles(_ value: OCFile)

    @objc(removeFilesObject:)
    @NSManaged public func removeFromFiles(_ value: OCFile)

    @objc(addFiles:)
    @NSManaged public func addToFiles(_ values: NSSet)

    @objc(removeFiles:)
    @NSManaged public func removeFromFiles(_ values: NSSet)

}
