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
    
    func loadItems() {
        isLoading = true
        var items:[ItemCellViewModel] = []
        items.append(ItemCellViewModel(imageURL: nil, name: "Test title ", detailText1: "Test detail 1", detailText2: "Test detail 2"))
        items.append(ItemCellViewModel(imageURL: nil, name: "Test title ", detailText1: "Test detail 1", detailText2: "Test detail 2"))
        items.append(ItemCellViewModel(imageURL: nil, name: "Test title ", detailText1: "Test detail 1", detailText2: "Test detail 2"))
        items.append(ItemCellViewModel(imageURL: nil, name: "Test title ", detailText1: "Test detail 1", detailText2: "Test detail 2"))
        itemsFetched?(items)
        isLoading = false
    }
}
