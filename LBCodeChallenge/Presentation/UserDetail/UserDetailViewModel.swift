//
//  UserDetailViewModel.swift
//  LloydsCodeChallenge
//
//  Created by Mehtab Ahmed on 13/04/2022.
//

import Foundation

struct UserDetailViewModel {
    
    private var selectedItem:User
    
    var selectedItemChanged: ((User) -> Void)?
    
    init(item:User) {
        
        self.selectedItem = item
    }
    
    
    func getSelectedUser() {
        selectedItemChanged?(selectedItem)
    }
    
}
