//
//  DetailPageViewModel.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation

class DetailPageViewModel: ViewModel{
    required init(){}

    var error: Error?
    
    var state: Observable<ViewModelState> = Observable(value: .completed)
    
    var hits: [Hit] = []
    
    var currentIndex: Int = 0
    
    var detailViewModel: DetailViewModel?{
        if (currentIndex >= hits.count) || (currentIndex < 0){
            return nil
        }
        let viewModel = DetailViewModel()
        viewModel.hit = hits[currentIndex]
        return viewModel
    }
    
    var previousDetailViewModel: DetailViewModel?{
        currentIndex -= 1
        return detailViewModel
    }
    
    var nextDetailViewModel: DetailViewModel?{
        currentIndex += 1
        return detailViewModel

    }
}
