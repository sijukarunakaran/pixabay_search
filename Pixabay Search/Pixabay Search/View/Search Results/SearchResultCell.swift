//
//  SearchResultCell.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

class SearchResultCell: UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        imageView.image = nil
        imageView.cancelImageLoad()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        var newFrame = layoutAttributes.frame
        newFrame.size.width = UIScreen.main.bounds.width / 2
        newFrame.size.height = UIScreen.main.bounds.width / 2
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
