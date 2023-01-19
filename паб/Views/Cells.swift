//
//  Cells.swift
//  паб
//
//  Created by Admin on 13.01.23.
//

import UIKit

class Cells: UITableViewCell {
    
    static let identifier = "Cells"
    
    @IBOutlet var beerName: UILabel!
    @IBOutlet var country: UILabel!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var remains: UILabel!
    
    var beerSetting: Beer! {
        didSet {
            beerName.text = beerSetting.beerName
            remains.text = "Ост.: \(beerSetting.remains)"
            country.text = beerSetting.country
        }
    }    
}
