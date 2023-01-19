//
//  ViewController.swift
//  паб
//
//  Created by Admin on 8.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var viewModel = BeerViewModel ()
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
     
        viewModel.layoutBeer()
        layoutTableView()
    }
    func updateRemains (for index:Int){
    }



    
    func layoutTableView () {
       tableView.delegate = self
       tableView.dataSource = self
        tableView.register(UINib(nibName: Cells.identifier, bundle: nil), forCellReuseIdentifier: Cells.identifier)
    }
    
    
}



 extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.beerPicked()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "pickVolumeViewController") as? pickVolumeViewController else { return }
        destinationViewController.modalPresentationStyle = .fullScreen
        present(destinationViewController, animated: true)
        destinationViewController.viewModel.currentBeerArray.value = viewModel.beerArray.value[indexPath.item]
        destinationViewController.viewModel.index.value = indexPath.row
        
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.identifier) as? Cells else { return UITableViewCell()}
        cell.beerSetting = viewModel.beerArray.value[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   viewModel.beerArray.value.count
    }
}


