//
//  AccountsViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 28/07/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import UIKit
import MMDrawerController
import SwiftyDropbox
import CoreData

class AccountsViewController : CoreDataTableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getDropboxAccount), name: NSNotification.Name(rawValue: "DropBoxLoginSuccess"), object: nil)
    }
    
    @objc func getDropboxAccount() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let client = DropboxClientsManager.authorizedClient
        client?.users.getCurrentAccount().response(completionHandler: { (account, error) in
            let newAccount = NSEntityDescription.insertNewObject(forEntityName: "Account", into: appDelegate.managedObjectContext) as! Account
            newAccount.email = account?.email
            newAccount.name = account?.name.givenName
            appDelegate.saveContext()
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func entityName() -> String! {
        return "Account"
    }
    
    override func textLabelText(_ indexPath: IndexPath) -> String? {
        if let account = fetchedResultsController.object(at: indexPath) as? Account {
            return account.name
        }
        return nil
    }
    
    override func predicate() -> NSPredicate? {
        return nil
    }
}
