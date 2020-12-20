//
//  ImageSearchViewModel.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation

class ImageSearchViewModel: ViewModel {
    
    required init(){}

    var error: Error?
    
    var state: Observable<ViewModelState> = Observable(value: .completed)
    
    var searchKeyword = ""
    
    var searchResult: ImageSearchResponse?
    
    var page = 1
    
    var numberOfResults: Int { searchResult?.hits.count ?? 0 }
    
    func previewImageUrl(for index: Int) -> String?{
        guard let hits = searchResult?.hits, (0..<hits.count) ~= index else {
            return nil
        }
        return searchResult?.hits[index].previewURL
    }
    
    func detailPageViewModel(for index: Int) -> DetailPageViewModel?{
        guard let hits = searchResult?.hits, (0..<hits.count) ~= index else {
            return nil
        }
        let viewModel = DetailPageViewModel()
        viewModel.hits = hits
        viewModel.currentIndex = index
        return viewModel
    }
    
    
    func search(){
        if searchKeyword.isEmpty{
            self.error = APIError.server(message: "Please enter a keyword to search.")
            self.state.value = ViewModelState.error
            return
        }
        self.state.value = .inProgress
        let dataStoreAction = curry(ImageSearchDataStore()
                                        .getAll(keyword:page:completion:))(searchKeyword)(page)
        get(dataStoreAction) { (result) in
            if self.searchResult == nil{
                self.searchResult = result
                return
            }
            self.searchResult = self.searchResult?.merge(with: result)
        }
    }
    
}
