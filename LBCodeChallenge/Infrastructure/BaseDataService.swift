//
//  DataService.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import Foundation

protocol BaseDataService {
    func loadItems(completion:@escaping ([ItemCellViewModel]) -> Void, failure:@escaping (String) -> Void)
}
