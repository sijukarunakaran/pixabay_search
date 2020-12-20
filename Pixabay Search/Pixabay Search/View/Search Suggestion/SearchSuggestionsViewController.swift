//
//  SearchSuggestionsViewController.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

protocol SuggestedSearch: class {
    func didSelectSuggestedSearch(keyword: String)
}

class SearchSuggestionsViewController: TableView<SearchSuggestionViewModel> {
    
    weak var suggestedSearchDelegate: SuggestedSearch?
    
    static func loadFromStoryboard() -> SearchSuggestionsViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "SearchSuggestionsViewController") as? SearchSuggestionsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        viewModel.refresh()
    }
    
    override func reload(){
        self.tableView.reloadData();
    }
}

extension SearchSuggestionsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSuggestions
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = viewModel.suggestion(for: indexPath.row)

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let keyword = viewModel.suggestion(for: indexPath.row) else { return }
        suggestedSearchDelegate?.didSelectSuggestedSearch(keyword: keyword)
    }

}
