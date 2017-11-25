//
//  AccountsViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 28/07/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import UIKit

class AccountsViewController : CoreDataTableViewController {
    override func entityName() -> String! {
        return "Account"
    }
    
    override func predicate() -> NSPredicate? {
        return nil
    }
}
