//
//  ViewModalAttachable.swift
//  Pixabay Search
//
//  Created by Siju on 20/01/20.
//  Copyright © 2020 Siju. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewModalAttachable {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType { get }
}


