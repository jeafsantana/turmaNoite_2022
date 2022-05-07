//
//  ViewController.swift
//  Colearning
//
//  Created by Adriano Souza Costa on 26/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carrosCollectionView: UICollectionView!
    
    let carros = [
        "onix",
        "tiida",
        "fusca",
        "golf"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        carrosCollectionView.dataSource = self
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as? CarroCell
        let carro = carros[indexPath.item]
        
        celula?.configure(carro: carro)
        
        return celula ?? UICollectionViewCell()
    }
    
}
