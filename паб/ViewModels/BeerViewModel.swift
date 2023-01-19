//
//  ViewModel.swift
//  паб
//
//  Created by Admin on 14.01.23.
//

import Foundation
import UIKit
 
public class BeerViewModel {
    var beerArray = Box([Beer]())
    var currentBeerRemains = Box(Double(0))
    var currentBeerPrice = Box(Int(0))
    var currentBeerArray = Box(Beer(beerName: "", country: "", price: 0, remains: 0))
    var index = Box(Int(0))
    
    func layoutBeer () {
        beerArray.value.append(Beer(beerName: "Александрыя", country: "🇧🇾", price: 3, remains: 43))
        beerArray.value.append(Beer(beerName: "Лідскае піва", country: "🇧🇾", price: 4, remains: 65))
        beerArray.value.append(Beer(beerName: "Kрыніца", country: "🇧🇾", price: 3, remains: 37))

    }
   
    

    func addBeer () {
        
    }
    
    func beerPicked () {
       
    }
}
