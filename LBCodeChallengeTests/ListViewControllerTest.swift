//
//  ListViewControllerTest.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 21/04/2022.
//

import Foundation
import XCTest
@testable import LBCodeChallenge

class ListViewControllerTest: XCTestCase {

    func test_VCTitle() {
        let sut = get_sut()
        XCTAssertEqual(sut.title, "Zoo Animal")
    }
    
    func test_checkDependencies() {
        let sut = get_sut()
        XCTAssertNotNil(sut.listVM)
    }
  
    func test_dataItemsAfterLoad() {
        let sut = get_sut()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.numberOfRows(), 5)
    }
    
    func test_cellConfigure() {
        let sut = get_sut()
        sut.loadViewIfNeeded()
        let cell = sut.cell(atRow: 0)
        
        XCTAssertEqual(sut.name(atCell: cell), "Name: Animal 1")
        XCTAssertEqual(sut.habbitate(atCell: cell), "Habbitate: Habbitate 1")
        
        let cell1 = sut.cell(atRow: 1)
        
        XCTAssertEqual(sut.name(atCell: cell1), "Name: Animal 2")
        XCTAssertEqual(sut.habbitate(atCell: cell1), "Habbitate: Habbitate 2")
    }
    
    func get_sut() -> ListViewController {
        let vc = ListViewController()
        let lvm = ListViewModel(dataService: MockNetworkService())
        vc.listVM = lvm
        vc.title = "Zoo Animal"
        return vc
    }

}


private extension ListViewController {
    
    func numberOfRows() -> Int {
        return tableView.numberOfRows(inSection: section)
    }
    
    func cell(atRow row:Int) -> ItemTableViewCell? {
        let indextPath = IndexPath(row: row, section: section)
        let cell = tableView(tableView, cellForRowAt: indextPath) as? ItemTableViewCell
        return cell
    }
    
    func name(atCell cell:ItemTableViewCell?) -> String? {
        return cell?.itemTitleLabel.text
    }
    
    func type(atCell cell:ItemTableViewCell?) -> String? {
        return cell?.itemDetailLabel1.text
    }
    
    func habbitate(atCell cell:ItemTableViewCell?) -> String? {
        return cell?.itemDetailLabe2.text
    }
    
    private var section : Int { 0 }
}


class MockNetworkService:BaseDataService {
    
    func loadItems(completion: @escaping ([ItemCellViewModel]) -> Void, failure: @escaping (String) -> Void) {
        
        var items:[Animal] = []
        for i in 1...5 {
            
            let animal = Animal(name: "Animal \(i)", latinName: "Latin animal \(i)", habitat: "Habbitate \(i)", imageLink: "")
            
            items.append(animal)
        }
        
        completion( items.map { item in
            ItemCellViewModel(animal: item, selection: {
                
            })
        })
    }
}

