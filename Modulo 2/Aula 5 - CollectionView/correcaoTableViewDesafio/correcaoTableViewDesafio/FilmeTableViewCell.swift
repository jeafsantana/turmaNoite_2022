//
//  FilmeTableViewCell.swift
//  correcaoTableViewDesafio
//
//  Created by Jessica Santana on 29/04/22.
//

import UIKit

class FilmeTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var tituloFilmeLabel: UILabel!
    @IBOutlet weak var generoFilmeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configuraCelulaDoFilme(poster: UIImage, tituloFilme: String, generoFilme: String) {
        posterImageView.image = poster
        tituloFilmeLabel.text = tituloFilme
        generoFilmeLabel.text = generoFilme
    }
    
    func configuraCelulaDoFilmeMelhorado(filme: Filme) {
        posterImageView.image = filme.poster
        tituloFilmeLabel.text = filme.titulo
        generoFilmeLabel.text = filme.genero
    }
}
