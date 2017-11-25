//
//  AppManager.swift
//  Overclouded
//
//  Created by Parag Dulam on 04/06/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class AppManager : NSObject {
    
    class func context() -> NSManagedObjectContext! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
}
