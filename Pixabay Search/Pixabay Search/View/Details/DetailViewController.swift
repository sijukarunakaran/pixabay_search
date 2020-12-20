//
//  DetailViewController.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

class DetailViewController: View<DetailViewModel> {
    
    @IBOutlet weak var imageView: UIImageView?
    
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
        imageView?.image = viewModel.largeImage
    }

}
