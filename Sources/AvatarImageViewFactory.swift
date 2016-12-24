//
//  AvatarImageViewFactory.swift
//  MessageKit
//
//  Created by P D Leonard on 12/23/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//
//  The AvatarImageFactory is simply instantiated but also can be completely customised. It is a default helper
//  to accommodate the creation of avatars for messages.


import UIKit

class AvatarImageViewFactory: UIImageView {
    
    var initalsLabel: UILabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: Avatar) {
        super.init(image: image.image)
    }
    
    convenience init(avatar: Avatar, initals: String = "?", diameter: CGFloat = 40) {
        self.init(image: avatar)
        self.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        backgroundColor = .gray
        initalsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        prepareInitals()
        self.initalsLabel.text = initals
        self.image = avatar.image
        
        // Make it a circle
        self.layer.cornerRadius = diameter/2
        self.clipsToBounds = true
    }
    
    func prepareInitals() {
        initalsLabel.textColor = UIColor.white
        initalsLabel.textAlignment = .center
        initalsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        self.addSubview(initalsLabel)
    }
    
    // MARK: Helper
    
    func addBoarder(width: CGFloat?, borderColor: CGColor?) {
        self.layer.borderColor = borderColor ?? UIColor.white.cgColor
        self.layer.borderWidth = width ?? 0
    }
}
