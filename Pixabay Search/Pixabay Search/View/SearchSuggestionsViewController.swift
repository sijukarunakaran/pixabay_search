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

class SearchSuggestionsViewController: UITableViewController {
    
    weak var suggestedSearchDelegate: SuggestedSearch?
    
    static func loadFromStoryboard() -> SearchSuggestionsViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "SearchSuggestionsViewController") as? SearchSuggestionsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(indexPath)"

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        suggestedSearchDelegate?.didSelectSuggestedSearch(keyword: "")
    }

}
