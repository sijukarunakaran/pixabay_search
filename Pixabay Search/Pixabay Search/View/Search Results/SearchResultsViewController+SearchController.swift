//
//  SearchResultsViewController+SearchController.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

extension SearchResultsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.searchKeyword = text
    }
}

extension SearchResultsViewController: UISearchControllerDelegate{
    func presentSearchController(_ searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        searchController.showsSearchResultsController = false
    }
}

extension SearchResultsViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.resignFirstResponder()
        searchController.showsSearchResultsController = false
        viewModel.search()
    }
}
