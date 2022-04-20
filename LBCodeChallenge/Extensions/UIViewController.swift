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
        let viewModel = AnimalDetailViewModel(item: animal)
        let vc = AnimalDetailViewController(vm: viewModel)
        self.show(vc, sender: self)
    }
    
    func selectUser(user: User) {
        let viewModel = UserDetailViewModel(item: user)
        let vc = UserDetailViewController(vm: viewModel)
        self.show(vc, sender: self)
    }
}
