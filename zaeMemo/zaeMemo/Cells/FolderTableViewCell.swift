//
//  FolderTableViewCell.swift
//  zaeMemo
//
//  Created by 재영신 on 2021/10/06.
//

import UIKit

class FolderTableViewCell: UITableViewCell {

    lazy var folderName : UILabel = {
       var label = UILabel()
        return label
    }()
    lazy var folderImg : UIImage = {
        var image = UIImage()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
