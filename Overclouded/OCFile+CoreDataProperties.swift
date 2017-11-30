//
//  OCFile+CoreDataProperties.swift
//  
//
//  Created by Parag Dulam on 30/11/17.
//
//

import Foundation
import CoreData


extension OCFile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OCFile> {
        return NSFetchRequest<OCFile>(entityName: "OCFile")
    }

    @NSManaged public var name: String?
    @NSManaged public var account: Account?

}
