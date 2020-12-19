//
//  UIImageView+WebImage.swift
//  ImageLoader
//
//  Created by Siju on 18/12/20.
//

import UIKit

extension UIImageView {
  func loadImage(at url: URL) {
    ImageLoader.loader.load(url, for: self)
  }
  func cancelImageLoad() {
    ImageLoader.loader.cancel(for: self)
  }
}
