//
//  Avatar.swift
//  MessageKit
//
//  Created by P D Leonard on 12/22/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
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


//public struct Avatar {
//    
//    public let image: UIImage?
//    
//    public let highlightedImage: UIImage?
//    
//    public let placeholderImage: UIImage
//    
//    public init(image: UIImage? = nil, highlightedImage: UIImage? = nil, placeholderImage: UIImage) {
//        self.image = image
//        self.highlightedImage = highlightedImage
//        self.placeholderImage = placeholderImage
//    }
//    
//    public func image(highlighted: Bool) -> UIImage {
//        guard let image = image else {
//            return placeholderImage
//        }
//        
//        guard let highlightedImage = highlightedImage else {
//            return image
//        }
//        
//        return highlighted ? image : highlightedImage
//    }
//}
