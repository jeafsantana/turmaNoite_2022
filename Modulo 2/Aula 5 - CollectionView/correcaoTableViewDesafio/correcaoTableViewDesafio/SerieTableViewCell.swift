//
//  SerieTableViewCell.swift
//  correcaoTableViewDesafio
//
//  Created by Jessica Santana on 29/04/22.
//

import UIKit

class SerieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterSerieImageView: UIImageView!
    @IBOutlet weak var tituloSerieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configuraCelulaSerie(posterSerie: UIImage, tituloSerie: String) {
        posterSerieImageView.image = posterSerie
        tituloSerieLabel.text = tituloSerie
    }

}
