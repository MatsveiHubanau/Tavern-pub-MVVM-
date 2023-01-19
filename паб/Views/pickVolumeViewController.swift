//
//  chooseVolumeViewController.swift
//  паб
//
//  Created by Admin on 17.01.23.
//

import Foundation
import UIKit

class pickVolumeViewController: UIViewController {
    
    let viewModel = BeerViewModel()
    
    @IBOutlet var volume0_5: UIButton!
    @IBOutlet var volume1_0: UIButton!
    @IBOutlet var volume2_0: UIButton!
    @IBOutlet var remainsLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBAction func exitButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    override func viewDidLoad () {
        super.viewDidLoad()
        volume0_5.layer.cornerRadius = volume0_5.frame.height/2
        volume1_0.layer.cornerRadius = volume1_0.frame.height/2
        volume2_0.layer.cornerRadius = volume2_0.frame.height/2
        remainsLabel.layer.cornerRadius = 30
        remainsLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 30
        priceLabel.layer.masksToBounds = true
        bindCurrentValues()
        print(viewModel.currentBeerArray.value.price)
    }
    
    func bindCurrentValues () {
        viewModel.currentBeerPrice.bind (listener: { [weak self] currentBeerPrice in
            self?.priceLabel.text = "\(currentBeerPrice) р." })
        viewModel.currentBeerPrice.bind(listener: { [weak self] currentBeerPrice in
            self?.remainsLabel.text = "\(currentBeerPrice) л." })
        
        viewModel.currentBeerPrice.value = viewModel.currentBeerArray.value.price
        viewModel.currentBeerRemains.value = viewModel.currentBeerArray.value.remains
        
            priceLabel.text = "\(viewModel.currentBeerArray.value.price) р."
        remainsLabel.text = "\(viewModel.currentBeerArray.value.remains) л."
    }
    
}
