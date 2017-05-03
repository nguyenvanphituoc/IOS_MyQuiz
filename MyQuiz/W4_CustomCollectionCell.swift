//
//  CustomCollectionCell.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/26/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMyImg: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            imgMyImg.layer.borderWidth = isSelected ? 10 : 0
        }
    }
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        isSelected = false
    }
    
    func setGalleryItem(_ item: FlickrPhoto) {
        imgMyImg.image = item.thumbnail
    }
}
