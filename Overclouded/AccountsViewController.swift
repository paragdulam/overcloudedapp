//
//  AccountsViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 28/07/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import UIKit
import MMDrawerController

class AccountsViewController : CoreDataTableViewController {
    override func entityName() -> String! {
        return "Account"
    }
    @IBAction func addAccountButtonTapped(_ sender: Any) {
        
         let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let centerVC = mainStoryBoard.instantiateViewController(withIdentifier: "FileDetails") as! FilesViewController
        
         let centerSideNav = UINavigationController(rootViewController: centerVC)
        
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.drawerController!.centerViewController=centerSideNav
        appDelegate.drawerController!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
    }
    
    override func predicate() -> NSPredicate? {
        return nil
    }
}
