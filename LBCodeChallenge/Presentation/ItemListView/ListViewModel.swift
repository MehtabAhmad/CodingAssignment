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
        RemoteAPI.shared.getRequest(url: EndPoints.usersList, completion: { [weak self] (users:[User]) in
            self?.itemsFetched?(users.map{user in
                ItemCellViewModel(user: user)
            })
            self?.isLoading = false
        }, failure: { [weak self] error in
            self?.errorMessage = error
            self?.isLoading = false
        })
    }
    
    func loadAnimals() {
        RemoteAPI.shared.getRequest(url: EndPoints.animalsList, completion: { [weak self] (animals:[Animal]) in
            self?.itemsFetched?(animals.map{animal in
                ItemCellViewModel(animal: animal)
            })
            self?.isLoading = false
        }, failure: { [weak self] error in
            self?.errorMessage = error
            self?.isLoading = false
        })
    }
}
