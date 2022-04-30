//
//  MovieCollectionViewCell.swift
//  aula_collectionview
//
//  Created by Jessica Arruda Ferreira de Santana on 01/09/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    public func configure(with movie: Movie) {
        imageView.image = UIImage(named: movie.nomeImagem)
        nameLabel.text = movie.titulo
    }
    
}
