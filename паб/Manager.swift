//
//  Manager.swift
//  паб
//
//  Created by Admin on 10.09.22.
//

import Foundation
class manager {
    
    var margin = 0.0
    var Selled = 0.0
    private init() { }
    static let shared = manager()
    func round (_ num:Double) -> Double {
    var result = num * 100
    result += 0.5
    return Double(Int(result)) / 100
    }
    func newDay (){
        
    }
}
