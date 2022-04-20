//
//  UIViewController.swift
//  LloydsCodeChallenge
//
//  Created by Mehtab Ahmed on 13/04/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func selectAnimal(animal: Animal) {
        let vc = AnimalDetailViewController()
        self.show(vc, sender: self)
    }
    
    func selectUser(user: User) {
        let vc = UserDetailViewController()
        self.show(vc, sender: self)
    }
}
