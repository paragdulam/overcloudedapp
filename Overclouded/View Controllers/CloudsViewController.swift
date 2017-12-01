//
//  CloudsViewController.swift
//  Overclouded
//
//  Created by Parag Dulam on 30/11/17.
//  Copyright © 2017 Parag Dulam. All rights reserved.
//

import Foundation
import UIKit
import SwiftyDropbox

class CloudsViewController : UITableViewController {
 
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(cancelButtonTapped(_:)), name: NSNotification.Name(rawValue: "DropBoxLoginSuccess"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                          controller: self,
                                                          openURL: { (url: URL) -> Void in
                                                            UIApplication.shared.openURL(url)
                                                            
            })
            break
        default:
            break
        }
    }
    

}
