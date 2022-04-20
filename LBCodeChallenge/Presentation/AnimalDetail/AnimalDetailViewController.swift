//
//  AnimalDetailViewController.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import UIKit
import Kingfisher

class AnimalDetailViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!
    @IBOutlet weak var habbitateLable: UILabel!

    var itemDetailVM:AnimalDetailViewModel
    
    init(vm: AnimalDetailViewModel) {
        self.itemDetailVM = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        itemDetailVM.getSelectedAnimal()
    }
    
    func setBindings() {
        
        itemDetailVM.selectedItemChanged = { [weak self] animal in
            self?.nameLabel.text = animal.name
            self?.latinNameLabel.text = animal.latinName
            self?.habbitateLable.text = animal.habitat
            self?.animalImageView.kf.indicatorType = .activity
            if let urlString = animal.imageLink {
                self?.animalImageView.kf.setImage(with: URL(string: urlString),
                                                  options: [
                                                    .processor(DownsamplingImageProcessor(size: (self?.animalImageView.frame.size)!)),
                                                    .scaleFactor(UIScreen.main.scale),
                                                    .cacheOriginalImage
                                                  ])
            }
        }
    }
}
