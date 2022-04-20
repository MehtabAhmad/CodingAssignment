//
//  AnimalDetailViewModel.swift
//  LloydsCodeChallenge
//
//  Created by Mehtab Ahmed on 10/04/2022.
//

import Foundation


struct AnimalDetailViewModel {
    
    private var selectedItem:Animal
    
    var selectedItemChanged: ((Animal) -> Void)?
    
    init(item:Animal) {
        
        self.selectedItem = item
    }
    
    
    func getSelectedAnimal() {
        selectedItemChanged?(selectedItem)
    }
    
}
