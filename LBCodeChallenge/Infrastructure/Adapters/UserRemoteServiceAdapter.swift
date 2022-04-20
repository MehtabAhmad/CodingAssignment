//
//  UserRemoteServiceAdapter.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import Foundation

struct UserRemoteServiceAdapter: BaseDataService {
    
    let url:String
    let api: RemoteAPI
   
    func loadItems(completion: @escaping ([ItemCellViewModel]) -> Void, failure: @escaping (String) -> Void) {
        api.getRequest(url: EndPoints.usersList, completion: { (users: [User]) in
            completion ( users.map { item in
                ItemCellViewModel(user: item)
                })
        },
        failure: { error in
            failure(error)
        })
    }
}
