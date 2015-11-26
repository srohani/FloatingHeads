//
//  FloatingMenuController.swift
//  FloatingMenuHeads
//
//  Created by Samer Rohani on 2015-11-25.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit


@objc
protocol FloatingMenuControllerDelegate: class {
    optional func floatingMenuController(controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int)
    optional func floatingMenuControllerDidCancel(controller: FloatingMenuController)
    
}




class FloatingMenuController: UIViewController {

    var buttonDirection = Direction.Up
    var buttonPadding: CGFloat = 70
    var buttonItems = [UIButton]()
    
    var labelDirection = Direction.Left
    var labelTitles = [String]()
    var buttonLabels = [UILabel]()
    
    
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
    
    func configureButtons(initial: Bool) {
        let parentController = presentingViewController!
        let center = parentController.view.convertPoint(fromView.center, fromView: fromView.superview)
        
        closeButton.center = center
        
        if initial {
            closeButton.alpha = 0
            closeButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            
            for (index, button) in buttonItems.enumerate() {
                button.center = center
                button.alpha = 0
                button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }
            for (index, label) in buttonLabels.enumerate() {
                let buttonCenter = buttonDirection.offsetPoint(center, offset: buttonPadding * CGFloat(index+1))
                
                let labelSize = labelDirection == .Up || labelDirection == .Down ? label.bounds.height : label.bounds.width
                let labelCenter = labelDirection.offsetPoint(buttonCenter, offset: buttonPadding/2 + labelSize)
                label.center = labelCenter
                label.alpha = 0
            }
            
        }
        else {
            closeButton.alpha = 1
            closeButton.transform = CGAffineTransformIdentity
            
            for (index, button) in buttonItems.enumerate() {
                button.center = buttonDirection.offsetPoint(center, offset: buttonPadding * CGFloat(index+1))
                button.alpha = 1
                button.transform = CGAffineTransformIdentity
            }
            
             for (index, label) in buttonLabels.enumerate() {
                let buttonCenter = buttonDirection.offsetPoint(center, offset: buttonPadding * CGFloat(index+1))
                
                let labelSize = labelDirection == .Up || labelDirection == .Down ? label.bounds.height : label.bounds.width
                let labelCenter = labelDirection.offsetPoint(buttonCenter, offset: buttonPadding/2 + labelSize/2)
                label.center = labelCenter
                label.alpha = 1
            }
        }
    }
    
//    for (index, button) in buttonItems.enumerate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurredView.frame = view.bounds
        view.addSubview(blurredView)
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: "handleCloseMenu:", forControlEvents: .TouchUpInside)
        view.addSubview(closeButton)
        
        for button in buttonItems {
            button.addTarget(self, action: "handleMenuButton:", forControlEvents: .TouchUpInside)
            view.addSubview(button)
        }
        
        for title in labelTitles {
            let label = UILabel()
            label.text = title
            label.textColor = UIColor.flatBlackColor
            label.textAlignment = .Center
            label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
            label.backgroundColor = UIColor.flatWhiteColor
            label.sizeToFit()
            label.bounds.size.height += 8
            label.bounds.size.width += 20
            label.layer.cornerRadius = 4
            label.layer.masksToBounds = true
            view.addSubview(label)
            buttonLabels.append(label)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animateButtons(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        animateButtons(false)
    }
    
    func animateButtons(visible: Bool) {
        configureButtons(visible)
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            [self]
            self.configureButtons(!visible)
            }, completion: nil)
    }
    
    
    func handleCloseMenu(sender: AnyObject) {
        delegate?.floatingMenuControllerDidCancel?(self)
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    func handleMenuButton(sender: AnyObject) {
        let button = sender as! UIButton
        if let index = buttonItems.indexOf(button) {
            delegate?.floatingMenuController?(self, didTapOnButton: button, atIndex: index)
        }
    }
}
