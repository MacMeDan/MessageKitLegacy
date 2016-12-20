//
//  Avatar.swift
//  MessageKit
//
//  Created by P D Leonard @MacmeDan on 5/25/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//
// The Avatar view is used on message cells. It is optional and has default parameters but allows full customizability
// There is a example Playground so you can exspriment with
// them and customise away.
//

import UIKit

public struct Avatar {
    
    public let imageView: UIImageView?
    
    public var backgroundColor: UIColor
    
    public var initalsLabel: UILabel?
    
    public init(image: UIImage?, initals: String = "?", diameter: CGFloat = 40) {
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        self.backgroundColor = .gray
        self.initalsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        prepareInitals()
        self.initalsLabel?.text = initals
        // Set the image
        
        self.imageView?.image = image
        
        // Make it a circle
        self.imageView?.layer.cornerRadius = diameter/2
        self.imageView?.clipsToBounds = true
    }
    
    func prepareInitals() {
        initalsLabel?.textColor = UIColor.white
        initalsLabel?.textAlignment = .center
        initalsLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        guard let label = initalsLabel else { return }
        self.imageView?.addSubview(label)
    }
    
    // MARK: Helper
    
    func addBoarder(width: CGFloat?, borderColor: CGColor?) {
        self.imageView?.layer.borderColor = borderColor ?? UIColor.white.cgColor
        self.imageView?.layer.borderWidth = width ?? 0
    }
}
