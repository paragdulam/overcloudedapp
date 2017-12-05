//
//  CoreDataTableViewController.swift
//  STSClient
//
//  Created by Parag Dulam on 16/11/17.
//  Copyright © 2017 Synergy. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataTableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var tableView : UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var fetchedResultsController: NSFetchedResultsController = { () -> NSFetchedResultsController<NSFetchRequestResult> in
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName())
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: sortDescriptorKey(), ascending: isAscending())
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let predicateString = predicate() {
            fetchRequest.predicate = NSPredicate(format: predicateString, argumentArray: [])
        }
        
        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }

    }
    
    // MARK: -
    // MARK: Overrides

    
    func entityName() -> String {
        return ""
    }
    
    func sortDescriptorKey() -> String {
        return ""
    }
    
    func cellReuseIdentifier() -> String {
        return ""
    }
    
    func isAscending() -> Bool {
        return true
    }
    
    func predicate() -> String? {
        return nil
    }
    
    func predicateParameters() -> [AnyObject]? {
        return nil
    }

    
    // MARK: -
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier(), for: indexPath)
        
        // Configure Table View Cell
        return configureCell(cell: cell, atIndexPath: indexPath)
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        // Fetch Record
        return cell
    }

    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
//    // MARK: -
//    // MARK: Fetched Results Controller Delegate Methods
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.beginUpdates()
//    }
//
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.endUpdates()
//    }
//
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch (type) {
//        case .insert:
//            if let indexPath = newIndexPath {
//                tableView.insertRows(at: [indexPath], with: .fade)
//            }
//            break;
//        case .delete:
//            if let indexPath = indexPath {
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//            break;
//        case .update:
//            if let indexPath = indexPath {
//                if let cell = tableView.cellForRow(at: indexPath) {
//                    let _ = configureCell(cell: cell, atIndexPath: indexPath)
//                    tableView.reloadRows(at: [indexPath], with: .automatic)
//                }
//            }
//            break;
//        case .move:
//            if let indexPath = indexPath {
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//
//            if let newIndexPath = newIndexPath {
//                tableView.insertRows(at: [newIndexPath], with: .fade)
//            }
//            break;
//        }
//    }
}
