//
//  CollectionViewCell.swift
//  Instagram
//
//  Created by Eldaniz on 08.08.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        storyImage.layer.borderWidth = 3
        storyImage.layer.borderColor = UIColor.gray.cgColor
        storyImage.layer.cornerRadius = storyImage.frame.height / 2
        
    }
}
