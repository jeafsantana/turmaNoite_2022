//
//  SerHumanoTableViewCell.swift
//  correcaoSegmentedControl
//
//  Created by Jessica Santana on 04/05/22.
//

import UIKit

class SerHumanoTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configuraCelula(foto: UIImage, nome: String) {
        fotoImageView.image = foto
        nomeLabel.text = nome
    }
    
    func configuraCelula(serHumano: SerHumano) {
        fotoImageView.image = serHumano.foto
        nomeLabel.text = serHumano.nome
    }
}
