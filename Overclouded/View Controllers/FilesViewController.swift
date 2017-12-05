//
//  FilesViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 28/07/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import UIKit

class FilesViewController : CoreDataTableViewController {
    

    override func entityName() -> String {
        return "OCFile"
    }
    
    override func cellReuseIdentifier() -> String {
        return "FilesCell"
    }
    
    override func sortDescriptorKey() -> String {
        return "name"
    }
    
    override func isAscending() -> Bool {
        return false
    }
    
    override func configureCell(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let file = fetchedResultsController.object(at: indexPath) as! OCFile
        let aCell = cell as! FilesTableViewCell
        aCell.textLabel?.text = file.name
        return cell
    }

    
}
