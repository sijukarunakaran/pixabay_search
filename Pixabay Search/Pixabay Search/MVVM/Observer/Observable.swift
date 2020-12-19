//
//  Observable.swift
//  Pixabay Search
//
//  Created by Siju on 21/01/20.
//  Copyright © 2020 Siju. All rights reserved.
//

import Foundation

public protocol ObservableProtocol : class {
    var observers : [ObserverProtocol] { get set }

    func addObserver(_ observer: ObserverProtocol)
    func removeObserver(_ observer: ObserverProtocol)
    func notifyObservers(_ observers: [ObserverProtocol])
}

public class Observable<T> {

    public typealias CompletionHandler = ((T) -> Void)

    public var value : T {
        didSet {
            self.notifyObservers(self.observers)
        }
    }

    var observers : [Int : CompletionHandler] = [:]

    public init(value: T) {
        self.value = value
    }

    public func addObserver(_ observer: ObserverProtocol, completion: @escaping CompletionHandler) {
        self.observers[observer.id] = completion
    }

    public func removeObserver(_ observer: ObserverProtocol) {
        self.observers.removeValue(forKey: observer.id)
    }

    func notifyObservers(_ observers: [Int : CompletionHandler]) {
        observers.forEach({ $0.value(value) })
    }

    deinit {
        observers.removeAll()
    }
}
