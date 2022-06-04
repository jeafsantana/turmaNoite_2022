//
//  DetalheDoFilmeViewController.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 03/06/22.
//

import UIKit

class DetalheDoFilmeViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var favoritoButton: UIButton!
    
    var viewModel: DetalheDoFilmeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        
        configuraTela()
    }
    
    private func configuraTela() {
        guard let viewModel = viewModel else { return }
        
        posterImageView.image = UIImage(named: viewModel.getPoster())
        nomeLabel.text = viewModel.getNome()
        anoLabel.text = viewModel.getAno()
        generoLabel.text = viewModel.getGenero()
        favoritoButton.setTitle(viewModel.getFavoritoButtonTitle(), for: .normal)
    }
    
    @IBAction func favoritoButtonAction(_ sender: Any) {
        viewModel?.selecionouNoBotaoDeFavorito()
    }
}

extension DetalheDoFilmeViewController: DetalheDoFilmeViewModelDelegate {
    func exibeAlertaDeFavoritar() {
        let alerta = UIAlertController(title: "Você está adicionando este filme aos favoritos", message: "Tem certeza que deseja adicionar este filme aos favoritos?", preferredStyle: .alert)
        
        let simAction = UIAlertAction(title: "Sim", style: .default, handler: {
            alerta in
            self.viewModel?.adicionarFilmeAosFavoritos()
        })
        let naoAction = UIAlertAction(title: "Nao", style: .destructive, handler: nil)
        
        alerta.addAction(simAction)
        alerta.addAction(naoAction)
        
        present(alerta, animated: true)
    }
    
    func exibeAlertaDeDesfavoritar() {
        let alerta = UIAlertController(title: "Você está removendo este filme dos favoritos", message: "Tem certeza que deseja remover este filme dos favoritos?", preferredStyle: .alert)
        
        let simAction = UIAlertAction(title: "Sim", style: .default, handler: {
            alerta in
            self.viewModel?.removerFilmeDosFavoritos()
        })
        let naoAction = UIAlertAction(title: "Nao", style: .destructive, handler: nil)
        
        alerta.addAction(simAction)
        alerta.addAction(naoAction)
        
        present(alerta, animated: true)
    }
    
    func alteraTituloDoBotaoDeFavorito() {
        guard let viewModel = viewModel else { return }

        favoritoButton.setTitle(viewModel.getFavoritoButtonTitle(), for: .normal)
    }
}
