//
//  CoreDataTableViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 28/07/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

import UIKit
import CoreData
import SwiftyDropbox
import MMDrawerController


class CoreDataTableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>!
    @IBOutlet var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName())
        fetchRequest.predicate = predicate()
        fetchRequest.sortDescriptors = sortDescriptors()
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("An error occurred")
        }
    }
    
    
    func entityName() -> String! {
        return nil
    }
    
    func predicate() -> NSPredicate? {
        return nil
    }
    
    func sortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "name", ascending: true)]
    }
    
    func textLabelText(_ indexPath: IndexPath) -> String? {
        return nil
    }

    
    
    //MARK:NSFetchedResultsControllerDelegate

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }

    
    //MARK:UITableViewDataSource, UITableViewDelegate

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let animal = fetchedResultsController.objectAtIndexPath(indexPath) as! Animal
        
        cell.textLabel?.text = textLabelText(indexPath)
//        cell.detailTextLabel?.text = animal.habitat
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.name
        }
        
        return nil
    }
    

}
