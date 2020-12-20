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
}
