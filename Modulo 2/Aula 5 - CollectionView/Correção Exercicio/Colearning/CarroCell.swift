//
//  CarroCell.swift
//  Colearning
//
//  Created by Adriano Souza Costa on 02/05/22.
//

import UIKit

class CarroCell: UICollectionViewCell {
    
    @IBOutlet weak var capaImageView: UIImageView!
    
    func configure(carro: String) {
        capaImageView.image = UIImage(named: carro)
    }
    
}
