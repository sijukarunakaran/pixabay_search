//
//  SearchResultsViewController+SearchController.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

extension SearchResultsViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchKeyword = searchBar.text ?? ""
        searchController.dismiss(animated: true, completion: nil)
        viewModel.search()
    }
}
