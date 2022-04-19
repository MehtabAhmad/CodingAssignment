//
//  ItemTableViewCell.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDetailLabel1: UILabel!
    @IBOutlet weak var itemDetailLabe2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func config(itemVM: ItemCellViewModel) {
        itemTitleLabel.text = itemVM.name
        itemDetailLabel1.text = itemVM.detailText1
        itemDetailLabe2.text = itemVM.detailText2
    }
}
