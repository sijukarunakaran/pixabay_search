//
//  PageView.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

open class PageView<T: ViewModel>: UIPageViewController, ViewModalAttachable, ObserverProtocol  {
    
    public typealias ViewModelType = T
    
    public var viewModel = ViewModelType()
    
    open func reload() {
        
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.state.addObserver(self, completion: didChange(_:))
    }
    
    open func showActivityIndicator(){
        self.showHUD(message: "Loading...")
    }
    
    open func hideActivityIndicator(){
        self.hideHUD()
    }
    
    open func showNoDataView(){
    }
    
    open func showNoNetworkView(){
    }
    
    open func showError(){
        alert(message: viewModel.error?.localizedDescription ?? "", title: "Error")
    }
    
    
    
    fileprivate func didChange(_ state: ViewModelState){
        DispatchQueue.main.async {
            switch state {
            case .inProgress:
                self.showActivityIndicator()
            case .completed:
                self.hideActivityIndicator()
                self.reload()
            case .empty:
                self.hideActivityIndicator()
                self.showNoDataView()
            case .error:
                self.hideActivityIndicator()
                self.showError()
            case .noNetwork:
                self.hideActivityIndicator()
                self.showNoNetworkView()
            }
        }
    }

}
