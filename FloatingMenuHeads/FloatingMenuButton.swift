//
//  FloatingMenuButton.swift
//  FloatingMenuHeads
//
//  Created by Samer Rohani on 2015-11-25.
//  Copyright © 2015 Samer Rohani. All rights reserved.
//

import UIKit

enum Direction {
    case Up
    case Down
    case Left
    case Right
    
    func offsetPoint(point: CGPoint, offset: CGFloat) -> CGPoint {
        switch self {
        case .Up:
            return CGPoint(x: point.x, y: point.y - offset)
        case .Down:
            return CGPoint(x: point.x, y: point.y + offset)
        case .Left:
            return CGPoint(x: point.x - offset, y: point.y)
        case .Right:
            return CGPoint(x: point.x + offset, y: point.y)
        }
    }
}


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



