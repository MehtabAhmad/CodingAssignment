//
//  ListViewModel.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import Foundation

class ListViewModel {
   
    let service:BaseDataService!
    
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
    
    init(dataService:BaseDataService) {
        self.service = dataService
    }
    
    
    func loadItems() {
        isLoading = true
        service.loadItems(completion: { [weak self] items in
            self?.itemsFetched?(items)
            self?.isLoading = false
        }, failure: { [weak self] error in
            self?.errorMessage = error
            self?.isLoading = false
        })
    }
}
