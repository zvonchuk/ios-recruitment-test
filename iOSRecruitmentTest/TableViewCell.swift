//
//  TableViewCell.swift
//  iOSRecruitmentTest
//
//  Created by Bazyli Zygan on 15.06.2016.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import AlamofireImage

class TableViewCell: UITableViewCell {

    var item: Item? {
        didSet {
            if let item = item {
                itemTitleLabel.text = item.name
                itemDescLabel.text = item.details
                
                if let icon = item.icon {
                    iconView.af_setImage(withURL: URL(string: icon)!)
                }
            } else {
                iconView.image = nil
                itemTitleLabel.text = "Test"
                itemDescLabel.text = "Some description"
            }
        }
    }
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 4
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.item = nil
    }
}
