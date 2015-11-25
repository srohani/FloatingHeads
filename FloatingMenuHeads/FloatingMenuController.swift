//
//  FloatingMenuController.swift
//  FloatingMenuHeads
//
//  Created by Samer Rohani on 2015-11-25.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit

class FloatingMenuController: UIViewController {

    
    let fromView: UIView
    
    // MARK: UIViewController
    
    init(fromView: UIView) {
        self.fromView = fromView
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .OverFullScreen
        modalTransitionStyle = .CrossDissolve
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    let closeButton = FloatingMenuButton(image: UIImage(named: "icon-close"), backgroundColor: UIColor.flatRedColor)
    
    func configureButtons() {
        let parentController = presentingViewController!
        let center = parentController.view.convertPoint(fromView.center, fromView: fromView.superview)
        
        closeButton.center = center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurredView.frame = view.bounds
        view.addSubview(blurredView)
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: "handleCloseMenu:", forControlEvents: .TouchUpInside)
        view.addSubview(closeButton)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureButtons()
    }
    
    func handleCloseMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil);
    }
}
