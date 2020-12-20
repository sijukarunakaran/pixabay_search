//
//  DetailPageViewController.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

class DetailPageViewController: PageView<DetailPageViewModel> {

    static func loadFromStoryboard(viewModel: DetailPageViewModel) -> DetailPageViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailPageViewController") as? DetailPageViewController
        controller?.viewModel = viewModel
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dataSource = self
        if let firstViewModel = viewModel.detailViewModel,
           let firstView = DetailViewController.loadFromStoryboard(firstViewModel){
            setViewControllers([firstView], direction: .forward, animated: true, completion: nil)
        }
        self.hidePageControl()
        self.navigationController?.hidesBarsOnTap = true
    }
    
    private func hidePageControl(){
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds.inset(by: self.view.safeAreaInsets)
            } else if subView is UIPageControl {
                subView.isHidden = true
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let previous = viewModel.previousDetailViewModel else {
            return nil
        }
        return DetailViewController.loadFromStoryboard(previous)
    }
    
    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let next = viewModel.nextDetailViewModel else {
            return nil
        }
        return DetailViewController.loadFromStoryboard(next)

    }
}
