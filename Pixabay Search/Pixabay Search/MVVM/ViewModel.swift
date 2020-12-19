//
//  ViewModel.swift
//  Pixabay Search
//
//  Created by Siju on 06/05/19.
//  Copyright © 2019 Siju. All rights reserved.
//

import UIKit

public protocol ViewModel: class, Initializable {
    var error: Error? { get set }
    var state: Observable<ViewModelState> { get set }
}

public extension ViewModel{
    func get<T: Decodable>(_ request: (@escaping (() throws -> T) -> Void) -> Void, completion: @escaping (T) -> Void){
        self.state.value = .inProgress
        request{ getdata in
            do {
                completion(try getdata())
                self.state.value = .completed
            }
            catch{
                self.error = error
                self.state.value = .error
            }
        }
    }
}
