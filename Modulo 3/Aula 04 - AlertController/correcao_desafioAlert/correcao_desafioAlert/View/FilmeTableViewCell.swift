//
//  FilmeTableViewCell.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 01/06/22.
//

import UIKit

class FilmeTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(viewModel: FilmeViewModel) {
        tituloLabel.text = viewModel.getNome()
    }
}
