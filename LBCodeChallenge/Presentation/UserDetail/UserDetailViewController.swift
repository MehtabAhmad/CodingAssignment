//
//  UserDetailViewController.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import UIKit
import Kingfisher

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLable: UILabel!
    
    var userDetailVM:UserDetailViewModel
    
    init(vm: UserDetailViewModel) {
        self.userDetailVM = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        userDetailVM.getSelectedUser()
    }
    
    
    func setBindings() {
        
        userDetailVM.selectedItemChanged = { [weak self] user in
            self?.nameLabel.text = user.name
            self?.emailLabel.text = user.email
            self?.addressLable.text = user.address
            self?.userImageView.kf.indicatorType = .activity
            if let urlString = user.image {
                self?.userImageView.kf.setImage(with: URL(string: urlString),
                                                  options: [
                                                    .processor(DownsamplingImageProcessor(size: (self?.userImageView.frame.size)!)),
                                                    .scaleFactor(UIScreen.main.scale),
                                                    .cacheOriginalImage
                                                  ])
            }
        }
    }
}
