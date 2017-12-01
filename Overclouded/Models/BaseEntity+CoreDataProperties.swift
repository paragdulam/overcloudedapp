//
//  BaseEntity+CoreDataProperties.swift
//  
//
//  Created by Parag Dulam on 02/12/17.
//
//

import Foundation
import CoreData


extension BaseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BaseEntity> {
        return NSFetchRequest<BaseEntity>(entityName: "BaseEntity")
    }

    @NSManaged public var name: String?

}
