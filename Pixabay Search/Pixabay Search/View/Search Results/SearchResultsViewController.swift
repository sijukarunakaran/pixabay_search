//
//  CollectionViewController.swift
//  Pixabay Search
//
//  Created by Siju on 18/12/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchResultsViewController: View<ImageSearchViewModel> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var searchController: UISearchController = {
        let searchSuggestionsViewController = SearchSuggestionsViewController.loadFromStoryboard()
        searchSuggestionsViewController?.suggestedSearchDelegate = self
        let search = UISearchController(searchResultsController: searchSuggestionsViewController)
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        return search
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        self.navigationItem.title = "Pixbay search"
    }
    
    override func reload() {
        self.collectionView.reloadData()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
            viewModel.search(nextPage: true)
        }
    }
    
}
