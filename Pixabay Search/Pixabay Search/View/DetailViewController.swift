//
//  DetailViewController.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

class DetailViewController: View<DetailViewModel> {
    
    var zoomImageView: ImageZoomView?
    
    static func loadFromStoryboard(_ viewModel: DetailViewModel) -> DetailViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        controller?.viewModel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func reload() {
        guard let image = viewModel.largeImage else { return }
        self.zoomImageView?.removeFromSuperview()
        self.zoomImageView = ImageZoomView(frame: self.view.bounds, image: image)
        self.view.addSubview(self.zoomImageView!)
    }

}
