//
//  ViewController.swift
//  FloatingMenuHeads
//
//  Created by Samer Rohani on 2015-11-25.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit




var delegate: FloatingMenuControllerDelegate?


class ViewController: UIViewController, FloatingMenuControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton(sender: AnyObject) {
        let controller = FloatingMenuController(fromView: sender as! UIButton)

        
        
        controller.buttonItems = [
            FloatingMenuButton(image: UIImage(named: "icon-add")),
            FloatingMenuButton(image: UIImage(named: "model-008")),
            FloatingMenuButton(image: UIImage(named: "model-007")),
            FloatingMenuButton(image: UIImage(named: "model-004")),
            FloatingMenuButton(image: UIImage(named: "model-005")),
        ]
        
        controller.labelTitles = [
            "New Contact",
            "Heidi Hernandez",
            "Neil Ross",
            "Elijah Woods",
            "Bella Douglas"
        ]
        presentViewController(controller, animated: true, completion: nil)
    }
    
    
    // MARK: FloatingMenuControllerDelegate
    
    func floatingMenuController(controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int) {
        print("tapped index \(index)")
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

}



