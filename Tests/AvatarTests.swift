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
        let initalsAvatar = Avatar(image: UIImage(), initals: "DL", diameter: 20)
        XCTAssertNotNil(initalsAvatar)
        XCTAssertEqual(initalsAvatar.imageView?.frame.width, 20)
        XCTAssertEqual(initalsAvatar.imageView?.frame.height, 20)
        XCTAssertEqual(initalsAvatar.initalsLabel?.frame.width, 20)
        XCTAssertEqual(initalsAvatar.initalsLabel?.text, "DL")
    }
    
}
