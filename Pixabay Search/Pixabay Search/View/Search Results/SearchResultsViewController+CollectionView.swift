//
//  SearchResultsViewController+CollectionView.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

extension SearchResultsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfResults
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(
                ofType: SearchResultCell.self,
                for: indexPath
            )
        
        if let urlString = viewModel.previewImageUrl(for: indexPath.row),
           let url = URL(string: urlString)
        {
            cell.imageView.loadImage(at: url)
        }
        
        return cell
    }
}

extension SearchResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailViewModel = viewModel.detailPageViewModel(for: indexPath.row),
              let controller = DetailPageViewController.loadFromStoryboard(viewModel: detailViewModel)
        else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(
            width: width,
            height: width
        )
    }
}
