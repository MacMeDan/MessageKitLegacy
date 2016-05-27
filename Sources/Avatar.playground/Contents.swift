//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
let view = UIView(frame: CGRect(x: 0, y: 0, width: 640, height: 400))
view.backgroundColor = UIColor.lightGrayColor()
XCPlaygroundPage.currentPage.liveView = view


class Avatar: UIImageView {
   
    
    init(image: UIImage?, initals: String?, diameter: Int?, backgroundColor: UIColor?) {
        
        // if an optional is not set default to a value
        let diameter = diameter ?? 40
        let frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        super.init(frame: frame)
        
        let backgroundColor = backgroundColor ?? UIColor.grayColor()
        self.backgroundColor = backgroundColor
        
        // Make it a circle
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        
        if image == nil {
            guard let initals = initals else  { return }
            
            getDefaultNameLabel(diameter, initals: initals)
        } else {
            self.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getDefaultNameLabel(diameter: Int, initals: String) -> UILabel {
        let initalsLabel = UILabel(frame: CGRect(x: diameter/2, y: diameter/2, width: diameter, height: diameter))
        initalsLabel.text = initals
        initalsLabel.textColor = UIColor.whiteColor()
        self.addSubview(initalsLabel)
        initalsLabel.textAlignment = .Center
        initalsLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        initalsLabel.center = self.center
        return initalsLabel
    }
    
    func addBoarder(width: CGFloat?, borderColor: CGColor?) {
        self.layer.borderColor = borderColor ?? UIColor.whiteColor().CGColor
        self.layer.borderWidth = width ?? 0
    }
    
}


let spaceFromTop: CGFloat = 130

// Avatar with image and Boarder
let avatar = Avatar(image: UIImage(named: "NiceSelfi.png"), initals: "DL", diameter: 90, backgroundColor: UIColor.blueColor())
avatar.addBoarder(2, borderColor: nil)

avatar.frame.origin.x = view.center.x - avatar.frame.width/2
avatar.frame.origin.y = 10


// Avatar without an image, custom diameter, and boarder
let initalsAvatar = Avatar(image: nil, initals: "DL", diameter: 90, backgroundColor: UIColor.blueColor())

initalsAvatar.backgroundColor = UIColor.blueColor()
initalsAvatar.addBoarder(2, borderColor: nil)

initalsAvatar.frame.origin.x = view.center.x - initalsAvatar.frame.width/2
initalsAvatar.frame.origin.y = spaceFromTop * 1

let noDiameter = Avatar(image: nil, initals: "JSQ", diameter: nil, backgroundColor: UIColor.greenColor())

// Simple implimintation
noDiameter.frame.origin.x = view.center.x - noDiameter.frame.width/2
noDiameter.frame.origin.y = spaceFromTop * 2

view.addSubview(avatar)
view.addSubview(initalsAvatar)
view.addSubview(noDiameter)
