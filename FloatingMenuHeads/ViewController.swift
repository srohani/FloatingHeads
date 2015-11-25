//
//  ViewController.swift
//  FloatingMenuHeads
//
//  Created by Samer Rohani on 2015-11-25.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton(sender: AnyObject) {
        let controller = FloatingMenuController(fromView: sender as! UIButton)
        presentViewController(controller, animated: true, completion: nil)
    }
    


}

