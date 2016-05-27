//
//  Avatar.swift
//  MessageKit
//
//  Created by P D Leonard @MacmeDan on 5/25/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//
// The Avatar view is used on message cells. It is optional on its parameters to allow customizability
// but has default values to prevent crashes. There is a example Playground so you can exspriment with
// them and customise away.
//

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
