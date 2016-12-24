//
//  Avatar.swift
//  MessageKit
//
//  Created by P D Leonard on 12/22/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

import UIKit

public struct Avatar {
    
    public let image: UIImage?
    
    public let highlightedImage: UIImage?
    
    public let placeholderImage: UIImage
    
    public init(image: UIImage? = nil, highlightedImage: UIImage? = nil, placeholderImage: UIImage) {
        self.image = image
        self.highlightedImage = highlightedImage
        self.placeholderImage = placeholderImage
    }
    
    public func image(highlighted: Bool) -> UIImage {
        guard let image = image else {
            return placeholderImage
        }
        
        guard let highlightedImage = highlightedImage else {
            return image
        }
        
        return highlighted ? image : highlightedImage
    }
}
