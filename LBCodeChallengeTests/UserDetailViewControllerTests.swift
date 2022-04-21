//
//  UserDetailViewControllerTests.swift
//  LBCodeChallengeTests
//
//  Created by Mehtab Ahmed on 21/04/2022.
//

import XCTest
@testable import LBCodeChallenge

class UserDetailViewControllerTests: XCTestCase {

    func test_userDetailData() {
        let sut = get_sut()

        sut.loadViewIfNeeded()
       
        XCTAssertEqual(sut.nameLabel.text, "TestUser")
        XCTAssertEqual(sut.emailLabel.text, "test@gmail.com")
        XCTAssertEqual(sut.addressLable.text, "st 1 somewhere")
   
    }
    
    func get_sut() -> UserDetailViewController {
        let detailViewModel = getDetailVM()
        return UserDetailViewController(vm: detailViewModel)
    }
    
    func getUser() -> User {
        let user = User(name: "TestUser", email: "test@gmail.com", address: "st 1 somewhere", image: "")
        return user
    }
    
    func getDetailVM() -> UserDetailViewModel {
        let user = getUser()
        return UserDetailViewModel(item: user)
    }
    
}
