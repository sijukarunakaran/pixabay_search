//
//  SearchSuggestionViewModel.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation

class SearchSuggestionViewModel: ViewModel{
    required init(){}

    var error: Error?
    
    var state: Observable<ViewModelState> = Observable(value: .completed)
    
    var suggestions: [String] = []
    
    var numberOfSuggestions = 10
    
    func suggestion(for index: Int) -> String?{
        guard (0..<suggestions.count) ~= index else {
            return nil
        }
        return suggestions[index]
    }
    
    private func loadSuggestions(){
        let dataStore = SuggestionsDataStore()
        get(dataStore.getAll) { (result) in
            self.suggestions = result
        }
    }
    
    func refresh(){
        loadSuggestions()
    }
    
}
