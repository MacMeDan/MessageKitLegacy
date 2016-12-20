//
//  AvatarTests.swift
//  MessageKit
//
//  Created by P D Leonard on 12/20/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

import XCTest
@testable import MessageKit


class AvatarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testAvatar() {
        let avatar = Avatar(image: UIImage())
        XCTAssertNotNil(avatar)
        XCTAssertEqual(avatar.imageView?.frame.width, 40)
        XCTAssertEqual(avatar.imageView?.frame.height, 40)
        XCTAssertEqual(avatar.initalsLabel?.frame.width, 40)
        XCTAssertEqual(avatar.initalsLabel?.text, "?")
        XCTAssertEqual(avatar.backgroundColor, .gray)
    }
    
    func testAvatarWithInitals() {
        // if the image is nil then the initals will be instatiated and used
        let initalsAvatar = Avatar(image: UIImage(), initals: "DL", diameter: 20, backgroundColor: .red)
        XCTAssertNotNil(initalsAvatar)
        XCTAssertEqual(initalsAvatar.imageView?.frame.width, 20)
        XCTAssertEqual(initalsAvatar.imageView?.frame.height, 20)
        XCTAssertEqual(initalsAvatar.initalsLabel?.frame.width, 20)
        XCTAssertEqual(initalsAvatar.backgroundColor, .red)
        //if the image is not nil then the initals are not set
        XCTAssertEqual(initalsAvatar.initalsLabel?.text, "DL")
    }
    
    func testAvatarWithImage() {
        let image = defaultImage().imageOfArtboard()
        let avatarWithImage = Avatar(image: image, initals: "DL", diameter: 40, backgroundColor: .gray)
        XCTAssertEqual(avatarWithImage.initalsLabel?.text, "DL")
    }
    
    
   
    


    
}
