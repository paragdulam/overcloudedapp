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


class CoreDataTableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    var fetchedResultsController : NSFetchedResultsController!
    @IBOutlet var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let fetchRequest = NSFetchRequest(entityName: entityName())
        fetchRequest.predicate = predicate()
        fetchRequest.sortDescriptors = sortDescriptors()
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: AppManager.context(), sectionNameKeyPath: nil, cacheName: nil)
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

    
    //MARK:UITableViewDataSource, UITableViewDelegate

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
//        let animal = fetchedResultsController.objectAtIndexPath(indexPath) as! Animal
        
        cell.textLabel?.text = "Dropbox"
//        cell.detailTextLabel?.text = animal.habitat
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.name
        }
        
        return nil
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Dropbox.authorizeFromController(self)
    }
    

}
