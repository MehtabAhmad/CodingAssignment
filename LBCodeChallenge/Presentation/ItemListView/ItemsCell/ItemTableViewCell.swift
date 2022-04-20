//
//  ItemTableViewCell.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import UIKit
import Kingfisher

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDetailLabel1: UILabel!
    @IBOutlet weak var itemDetailLabe2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.layer.cornerRadius = 7
    }
    
    
    func config(itemVM: ItemCellViewModel) {
        itemTitleLabel.text = itemVM.name
        itemDetailLabel1.text = itemVM.detailText1
        itemDetailLabe2.text = itemVM.detailText2
        itemImageView.kf.indicatorType = .activity
        
        itemImageView.kf.setImage(
            with: itemVM.imageURL,
            options: [
                .processor(DownsamplingImageProcessor(size: itemImageView.frame.size)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ])
        
    }
}
