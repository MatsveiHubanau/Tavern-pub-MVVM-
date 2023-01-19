//
//  ViewController.swift
//  паб
//
//  Created by Admin on 8.09.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Selled: UILabel!
    @IBOutlet weak var margin: UILabel!
    @IBOutlet var beerName: [UILabel]!
    @IBOutlet var country: [UILabel]!
    @IBOutlet var remains: [UILabel]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<manager.shared.beers.count {
            beerName[index].text = manager.shared.beers[index].beerName
            country[index].text = manager.shared.beers[index].country
            updateRemains(for: index)
            updateMargin()
            updateSelled()
        }
        func showAlert (withPrice price:Double) {
            if price < 0.01 {
                showAlert(withTitle: "Неудачная покупка", message: "Не хватает пива")} else {
                    showAlert(withTitle: "Покупка совершена", message: "Сумма покупки: \(price)byn")
                }
            
        }
        func showAlert(withTitle title:String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style:  .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    func updateRemains (for index:Int){
        let volume = manager.shared.beers[index].remains
        remains [index].text = "Ocтаток\n\(volume)л"
    }
    func updateMargin() {
        let newMargin = manager.shared.margin
        margin.text = "Выручка = \(newMargin)byn"
    }
    func updateSelled() {
        let selled = manager.shared.Selled
        Selled.text = "Проданно пива = \(selled)л"
    }
    @IBAction func buyBeer(_ sender: UIButton) {
        
        let tag = sender.tag
        let beerIndex = tag / 10
        let volume:Double
        switch tag % 10 {
        case 0: volume = 0.33
        case 1: volume = 0.5
        case 2: volume = 1
        default:
            volume = 0
        }
        var price = manager.shared.buyBeer(index: beerIndex, volume: volume)
        print ("Beer \(beerIndex), volume   \(volume)")
        updateRemains(for: beerIndex)
        updateMargin()
        updateSelled()
        
    }
    @IBAction func startNewDay(_ sender: UIButton) {
      manager.shared.newDay()
    //
    //
        print("New Day")
    }
}

