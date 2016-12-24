//
//  AvatarTests.swift
//  MessageKit
//
//  Created by P D Leonard on 12/22/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

import XCTest
@testable import MessageKit

class AvatarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testAvatar() {
        let avatarImage = Avatar(placeholderImage: UIImage())
        let avatarImageView = AvatarImageViewFactory(avatar: avatarImage)
        XCTAssertNotNil(avatarImageView)
        XCTAssertEqual(avatarImageView.frame.width, 40)
        XCTAssertEqual(avatarImageView.frame.height, 40)
        XCTAssertEqual(avatarImageView.initalsLabel.frame.width, 40)
        XCTAssertEqual(avatarImageView.initalsLabel.text, "?")
        XCTAssertEqual(avatarImageView.backgroundColor, .gray)
    }
    
    func testAvatarWithInitals() {
        let avatarImage = Avatar(placeholderImage: UIImage())
        let avatarWithInitals = AvatarImageViewFactory(avatar: avatarImage, initals: "DL", diameter: 20)
        XCTAssertNotNil(avatarWithInitals)
        XCTAssertEqual(avatarWithInitals.frame.width, 20)
        XCTAssertEqual(avatarWithInitals.frame.height, 20)
        XCTAssertEqual(avatarWithInitals.initalsLabel.frame.width, 20)
        XCTAssertEqual(avatarWithInitals.initalsLabel.text, "DL")
    }
    
}
