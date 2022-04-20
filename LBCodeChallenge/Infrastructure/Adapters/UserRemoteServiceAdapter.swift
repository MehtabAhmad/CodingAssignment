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
    var select:((User) -> Void)
   
    func loadItems(completion: @escaping ([ItemCellViewModel]) -> Void, failure: @escaping (String) -> Void) {
        api.getRequest(url: EndPoints.usersList, completion: { (people: [User]) in
            completion ( people.map { item in
                ItemCellViewModel(item, selection: {
                    select(item)
                })
                })
        },
        failure: { error in
            failure(error)
        })
    }
}
