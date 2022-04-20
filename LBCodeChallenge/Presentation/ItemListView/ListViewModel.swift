//
//  ListViewModel.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import Foundation

class ListViewModel {
   
    var itemsFetched: (([ItemCellViewModel]) -> Void)?
    var itemsFetchFailed: ((String) -> Void)?
    var loadingStateChanged: ((Bool) -> Void)?
    
    private var errorMessage = "" {
        didSet {
            itemsFetchFailed?(errorMessage)
        }
    }
    
    private var isLoading = false {
        didSet {
            loadingStateChanged?(isLoading)
        }
    }
    
    func loadUsers() {
        var items:[ItemCellViewModel] = []
        for _ in 0...10 {
            let user = User(name: "Test title", email: "test@gmail.com", address: "Test address", image: "")
            items.append(ItemCellViewModel(user: user))
        }
        itemsFetched?(items)
    }
    
    func loadAnimals() {
        var items:[ItemCellViewModel] = []
        for _ in 0...10 {
            let animal = Animal(name: "Test name", latinName: "Test latin name", habitat: "test habitat", imageLink: "")
            items.append(ItemCellViewModel(animal: animal))
        }
        itemsFetched?(items)
    }
}
