//
//  ItemCellViewModel.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import Foundation

struct ItemCellViewModel {
    
    var imageURL:URL?
    let name : String
    let detailText1  : String
    let detailText2 : String
    
    var select: (() -> Void)
    
    init(_ item: Any, selection: @escaping () -> Void) {
        
        if let animal = item as? Animal {
            self.init(animal: animal, selection: selection)
        }
        if let user = item as? User {
            self.init(user: user, selection: selection)
        }
        else {
            fatalError("Unknown item: \(item)")
        }
    }
}


extension ItemCellViewModel {
    
    init(animal:Animal, selection: @escaping () -> Void) {
        name = "Name: \(animal.name)"
        detailText1 = "Latine Name: \(animal.latinName)"
        detailText2 = "Habbitate: \(animal.habitat)"
        if let imageUrl = animal.imageLink {
            imageURL = URL(string: imageUrl)
        }
        self.select = selection
    }
    
    init(user:User, selection: @escaping () -> Void) {
        name = "Name: \(user.name )"
        detailText1 = "Email: \(user.email )"
        detailText2 = "Adress: \(user.address )"
        if let imageUrl = user.image {
            imageURL = URL(string: imageUrl)
        }
        self.select = selection
    }
}
