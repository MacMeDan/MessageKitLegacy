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
        prepareInitals(diameter: diameter)
        self.initalsLabel?.text = initals
        // Set the image
        if image == nil {
            
        } else {
            self.imageView?.image = image
        }
        
        // Make it a circle
        self.imageView?.layer.cornerRadius = diameter/2
        self.imageView?.clipsToBounds = true
    }
    
    mutating func prepareInitals(diameter: CGFloat) {
        self.initalsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        initalsLabel?.textColor = UIColor.white
        initalsLabel?.textAlignment = .center
        initalsLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        guard let label = initalsLabel else { return }
        self.imageView?.addSubview(label)
    }
    
    func addBoarder(width: CGFloat?, borderColor: CGColor?) {
        self.imageView?.layer.borderColor = borderColor ?? UIColor.white.cgColor
        self.imageView?.layer.borderWidth = width ?? 0
    }
}

class defaultImage:NSObject {
    
    func drawArtboard(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 35, height: 34), resizing: ResizingBehavior = .AspectFit) {
        /// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        /// Resize to Target Frame
        context.saveGState()
        let resizedFrame = resizing.apply(rect: CGRect(x: 0, y: 0, width: 35, height: 34), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 35, y: resizedFrame.height / 34)
        
        /// blankAvatar
        let blankAvatar = UIBezierPath()
        blankAvatar.move(to: CGPoint(x: 27.07, y: 27.07))
        blankAvatar.addCurve(to: CGPoint(x: 25.9, y: 22.3), controlPoint1: CGPoint(x: 27.07, y: 27.07), controlPoint2: CGPoint(x: 27.07, y: 24.65))
        blankAvatar.addCurve(to: CGPoint(x: 16.8, y: 17.74), controlPoint1: CGPoint(x: 25.02, y: 20.54), controlPoint2: CGPoint(x: 21.51, y: 19.5))
        blankAvatar.addLine(to: CGPoint(x: 16.8, y: 14.21))
        blankAvatar.addCurve(to: CGPoint(x: 18.24, y: 10.53), controlPoint1: CGPoint(x: 16.8, y: 14.21), controlPoint2: CGPoint(x: 18.24, y: 12.88))
        blankAvatar.addCurve(to: CGPoint(x: 18.24, y: 7.58), controlPoint1: CGPoint(x: 18.83, y: 10.53), controlPoint2: CGPoint(x: 19.42, y: 8.17))
        blankAvatar.addCurve(to: CGPoint(x: 19.42, y: 2.29), controlPoint1: CGPoint(x: 18.24, y: 7.23), controlPoint2: CGPoint(x: 19.82, y: 4.29))
        blankAvatar.addCurve(to: CGPoint(x: 10, y: 1.7), controlPoint1: CGPoint(x: 18.83, y: -0.66), controlPoint2: CGPoint(x: 10.59, y: -0.66))
        blankAvatar.addCurve(to: CGPoint(x: 8.83, y: 7.58), controlPoint1: CGPoint(x: 6.47, y: 1.7), controlPoint2: CGPoint(x: 8.83, y: 7.11))
        blankAvatar.addCurve(to: CGPoint(x: 8.83, y: 10.53), controlPoint1: CGPoint(x: 7.65, y: 8.17), controlPoint2: CGPoint(x: 8.24, y: 10.53))
        blankAvatar.addCurve(to: CGPoint(x: 10.27, y: 14), controlPoint1: CGPoint(x: 8.83, y: 12.88), controlPoint2: CGPoint(x: 10.27, y: 14))
        blankAvatar.addLine(to: CGPoint(x: 10.27, y: 17.74))
        blankAvatar.addCurve(to: CGPoint(x: 1.18, y: 22.3), controlPoint1: CGPoint(x: 5.56, y: 19.5), controlPoint2: CGPoint(x: 2.05, y: 20.54))
        blankAvatar.addCurve(to: CGPoint(x: 0, y: 27.07), controlPoint1: CGPoint(x: 0, y: 24.65), controlPoint2: CGPoint(x: 0, y: 27.07))
        blankAvatar.addLine(to: CGPoint(x: 13.54, y: 27.07))
        blankAvatar.addLine(to: CGPoint(x: 27.07, y: 27.07))
        blankAvatar.close()
        blankAvatar.move(to: CGPoint(x: 27.07, y: 27.07))
        context.saveGState()
        context.translateBy(x: 3.96, y: 3.46)
        blankAvatar.lineJoinStyle = .round
        context.saveGState()
        blankAvatar.lineWidth = 2
        context.beginPath()
        context.addPath(blankAvatar.cgPath)
        UIColor.white.setStroke()
        blankAvatar.stroke()
        context.restoreGState()
        context.restoreGState()
        
        context.restoreGState()
    }
    
    func imageOfArtboard() -> UIImage {
        struct LocalCache {
            static var image: UIImage!
        }
        if LocalCache.image != nil {
            return LocalCache.image
        }
        var image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 35, height: 34), false, 0)
        drawArtboard()
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        LocalCache.image = image
        return image
    }
    
    
    
    enum ResizingBehavior {
        case AspectFit /// The content is proportionally resized to fit into the target rectangle.
        case AspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case Stretch /// The content is stretched to match the entire target rectangle.
        case Center /// The content is centered in the target rectangle, but it is NOT resized.
        
        func apply(rect rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
            case .AspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .AspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .Stretch:
                break
            case .Center:
                scales.width = 1
                scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
    
}
