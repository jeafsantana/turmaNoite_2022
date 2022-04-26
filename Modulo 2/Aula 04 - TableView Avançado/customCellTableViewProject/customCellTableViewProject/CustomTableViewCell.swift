//
//  CustomTableViewCell.swift
//  customCellTableViewProject
//
//  Created by Jessica Santana on 25/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAmarela: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func mudarNomeDaLabel(nome: String) {
        labelAmarela.text = nome
    }

}
