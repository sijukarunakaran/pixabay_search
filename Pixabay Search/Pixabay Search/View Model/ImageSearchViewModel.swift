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
        return searchResult?.hits[index].webformatURL
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
    
    
    func search(nextPage: Bool = false){
        guard state.value != .inProgress else { return }
        if nextPage && searchResult == nil{
            return
        }
        if searchKeyword.isEmpty{
            self.error = PSError.generic(message: "Please enter a keyword to search.")
            self.state.value = ViewModelState.error
            return
        }
        self.state.value = .inProgress
        
        let dataStoreAction = curry(ImageSearchDataStore()
                                        .getAll(keyword:page:completion:))(searchKeyword)(nextPage ? page + 1 : page)
        get(dataStoreAction) { (result) in
            if result.hits.count > 1{
                self.saveForSuggestion()
                self.page += 1
            }
            else{
                self.error = PSError.generic(message: "Sorry, no matches found for your search.")
                self.state.value = ViewModelState.error
            }
            if !nextPage{
                self.searchResult = result
                return
            }
            self.searchResult = self.searchResult?.merge(with: result)
        }
    }
    
    private func saveForSuggestion(){
        let dataSore = SuggestionsDataStore()
        let dataStoreAction = curry(dataSore.create(_:completion:))(searchKeyword)
        get(dataStoreAction) { (result) in
            print("\(result) saved to suggestions")
        }
    }
    
}
