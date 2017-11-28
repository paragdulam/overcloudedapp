//
//  CenterViewController.swift
//  Overclouded
//
//  Created by apple on 26/11/17.
//  Copyright © 2017 Parag Dulam. All rights reserved.
//

import UIKit
import MMDrawerController

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ShowLeftDrawerButtonTapped(_ sender: Any) {
        
        var appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.drawerController!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
