//
//  AnimalRemoteServiceAdapter.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import Foundation

struct AnimalRemoteServiceAdapter: BaseDataService {
    
    let url:String
    let api: RemoteAPI
    var select:((Animal) -> Void)
   
    func loadItems(completion: @escaping ([ItemCellViewModel]) -> Void, failure: @escaping (String) -> Void) {
        api.getRequest(url: EndPoints.animalsList, completion: { (animals: [Animal]) in
            completion ( animals.map { item in
                ItemCellViewModel(animal: item, selection: {
                    select(item)
                })
                })
        },
        failure: { error in
            failure(error)
        })
    }
}
