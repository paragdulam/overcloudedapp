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
            
            client?.files.listFolder(path: "").response(completionHandler: { (files, error) in
                for file in (files?.entries)! {
                    let newFile = NSEntityDescription.insertNewObject(forEntityName: "OCFile", into: appDelegate.managedObjectContext) as! OCFile
                    newFile.name = file.name
                    newFile.account = newAccount
                    appDelegate.saveContext()
                }
            })
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func entityName() -> String {
        return "Account"
    }
    
    override func cellReuseIdentifier() -> String {
        return "AccountCell"
    }
    
    override func sortDescriptorKey() -> String {
        return "name"
    }
    
    override func isAscending() -> Bool {
        return false
    }
    
    override func configureCell(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let account = fetchedResultsController.object(at: indexPath) as! Account
        let aCell = cell as! AccountTableViewCell
        cell.accessoryType = .disclosureIndicator
        aCell.textLabel?.text = account.email
        return cell
    }

    
}
