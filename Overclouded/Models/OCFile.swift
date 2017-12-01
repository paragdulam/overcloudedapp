//
//  OCFile.swift
//  Overclouded
//
//  Created by Parag Dulam on 02/12/17.
//  Copyright © 2017 Parag Dulam. All rights reserved.
//

import Foundation
import CoreData

extension OCFile {
    
    func getNewFileObject() -> OCFile {
        let newAccount = NSEntityDescription.insertNewObject(forEntityName: "OCFile", into: context()) as! OCFile
        return newAccount
    }
    
    func getFile(_ id: String) -> OCFile? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OCFile")
        let predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.predicate = predicate
        do {
            if let results = try context().fetch(fetchRequest) as? [OCFile] {
                return results[0]
            }
        } catch {
            
        }
        return nil
    }
    
}
