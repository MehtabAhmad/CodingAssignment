//
//  AnimalDetailViewControllerTests.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 21/04/2022.
//

import Foundation
import XCTest
@testable import LBCodeChallenge

class DetailViewControllerTests:XCTestCase {
    
    func test_animalDetailData() {
        let sut = get_sut()
        
        sut.loadViewIfNeeded()
       
        XCTAssertEqual(sut.nameLabel.text, "Test Animal")
        XCTAssertEqual(sut.latinNameLabel.text, "Test Latin animal name")
        XCTAssertEqual(sut.habbitateLable.text, "Test Habbitate")
   
    }
    
    
    func get_sut() -> AnimalDetailViewController {
        let detailViewModel = getDetailVM()
        return AnimalDetailViewController(vm: detailViewModel)
    }
    
    
    func getAnimal() -> Animal {
        let selectedAnimal = Animal(name: "Test Animal", latinName: "Test Latin animal name", habitat: "Test Habbitate", imageLink: "")
        return selectedAnimal
    }
    
    func getDetailVM() -> AnimalDetailViewModel {
        let animal = getAnimal()
        return AnimalDetailViewModel(item: animal)
    }
}
