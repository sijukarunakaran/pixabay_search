//
//  SearchResultsViewController+SuggestedSearch.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

extension SearchResultsViewController: SuggestedSearch {
    func didSelectSuggestedSearch(keyword: String){
        viewModel.searchKeyword = keyword
        searchController.searchBar.text = keyword
        searchController.dismiss(animated: true, completion: nil)
        viewModel.search()
    }
}
