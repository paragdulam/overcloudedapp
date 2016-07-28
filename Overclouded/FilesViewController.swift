//
//  FilesViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 28/07/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import UIKit

class FilesViewController : CoreDataTableViewController {
    
    override func entityName() -> String! {
        return "OCFile"
    }
    
    override func predicate() -> NSPredicate? {
        return nil
    }
    
}
