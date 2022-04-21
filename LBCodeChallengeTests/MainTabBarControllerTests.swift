//
//  MainTabBarControllerTests.swift
//  LBCodeChallengeTests
//
//  Created by Mehtab Ahmed on 21/04/2022.
//

import Foundation
import XCTest
@testable import LBCodeChallenge

class MainTabBarControllerTests: XCTestCase {
    
    func test_TabBarControllerCount() {
        let sut = get_sut()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.viewControllers?.count, 2)
    }
    
    func test_InitialTabControllerTitle() {
        let sut = get_sut()
        sut.loadViewIfNeeded()
        let viewController = sut.viewControllers?.first
        let title = viewController?.title
        XCTAssertEqual(title, "Users")
    }
    
    func test_SecondTabControllerTitle() {
        let sut = get_sut()
        sut.loadViewIfNeeded()
        let viewController = sut.viewControllers?[1]
        let title = viewController?.title
        XCTAssertEqual(title, "Animals")
    }
    
    func test_InitialTabControllerDependencies() {
        let vc = getVC(fromTabbar: 0)
        XCTAssertNotNil(vc.listVM, "ListViewModel not injected in \(vc.title!)")
    }
    
    func test_SecondTabControllerDependencies() {
        let vc = getVC(fromTabbar: 1)
        XCTAssertNotNil(vc.listVM, "ListViewModel not injected in \(vc.title!)")
    }
    
    func get_sut() -> MainTabBarConroller {
        return MainTabBarConroller()
    }
    
    func getVC(fromTabbar at:Int) -> ListViewController {
        let sut = get_sut()
        sut.loadViewIfNeeded()
        let navC = sut.viewControllers?[at] as! UINavigationController
        let vc = navC.topViewController as! ListViewController
        return vc
    }
}
