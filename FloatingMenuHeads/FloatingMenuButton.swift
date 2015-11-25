//
//  FloatingMenuButton.swift
//  FloatingMenuHeads
//
//  Created by Samer Rohani on 2015-11-25.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit

class FloatingMenuButton: UIButton {
    

    func setup() {
        tintColor = UIColor.whiteColor()
        if backgroundImageForState(.Normal) == nil {
            setBackgroundImage(UIColor.flatBlueColor.pixelImage, forState: .Normal)
        }
        
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    convenience init(image: UIImage?, backgroundColor: UIColor = UIColor.flatBlueColor) {
        self.init()
        setImage(image, forState: .Normal)
        setBackgroundImage(backgroundColor.pixelImage, forState: .Normal)
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    }

}



