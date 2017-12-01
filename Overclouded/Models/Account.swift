//
//  Account.swift
//  Overclouded
//
//  Created by Parag Dulam on 02/12/17.
//  Copyright © 2017 Parag Dulam. All rights reserved.
//

import Foundation
import CoreData

extension Account {
    
    func getNewAccountObject() -> Account {
        let newAccount = NSEntityDescription.insertNewObject(forEntityName: "Account", into: context()) as! Account
        return newAccount
    }
    
    func getAccount(_ id: String) -> Account? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
        let predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.predicate = predicate
        do {
            if let results = try context().fetch(fetchRequest) as? [Account] {
                return results[0]
            }
        } catch {
            
        }
        return nil
    }
    
}
