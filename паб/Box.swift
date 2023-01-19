//
//  Box.swift
//  паб
//
//  Created by Admin on 14.01.23.
//

import Foundation
final class Box <T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind (listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    
}


