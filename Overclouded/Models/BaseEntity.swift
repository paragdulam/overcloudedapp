//
//  BaseEntity.swift
//  Overclouded
//
//  Created by Parag Dulam on 02/12/17.
//  Copyright © 2017 Parag Dulam. All rights reserved.
//

import Foundation
import CoreData
import UIKit


protocol GetContextProtocol {
    func context() -> NSManagedObjectContext
}

extension BaseEntity: GetContextProtocol {
    
    func context() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    
}

