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


class CoreDataTableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>!
    @IBOutlet var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName())
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

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let animal = fetchedResultsController.objectAtIndexPath(indexPath) as! Animal
        
        cell.textLabel?.text = "Dropbox"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Dropbox.authorizeFromController(self)
        DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                      controller: self,
                                                      openURL: { (url: URL) -> Void in
                                                        UIApplication.shared.openURL(url)
                                                        
        })
    }
    

}
