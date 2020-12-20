//
//  DetailViewModel.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation
import UIKit.UIImage

class DetailViewModel: ViewModel{
    required init(){}

    var error: Error?
    
    var state: Observable<ViewModelState> = Observable(value: .completed)
    
    var hit: Hit?{
        didSet{
            if hit != nil{
                loadImage()
            }
        }
    }
        
    var largeImage: UIImage?
    
    private func loadImage(){
        state.value = .inProgress
        if let urlString = hit?.largeImageURL,
           let url = URL(string: urlString)
        {
            ImageDownloader().loadImage(url) { (result) in
                switch result{
                case .success(let image):
                    self.largeImage = image
                    self.state.value = .completed
                case .failure(let error):
                    self.error = error
                    self.state.value = ViewModelState.error
                }
            }
        }
    }
    
    
}
