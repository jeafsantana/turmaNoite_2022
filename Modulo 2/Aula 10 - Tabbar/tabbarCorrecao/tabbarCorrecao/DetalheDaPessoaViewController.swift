//
//  DetalheDaPessoaViewController.swift
//  tabbarCorrecao
//
//  Created by Jessica Santana on 11/05/22.
//

import UIKit

class DetalheDaPessoaViewController: UIViewController {
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var alturaLabel: UILabel!
    
    var pessoa: Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaDadosDaPessoa()
    }
    
    private func atualizaDadosDaPessoa() {
        guard let pessoa = pessoa else { return }
        
        nomeLabel.text = pessoa.nome
        idadeLabel.text = String(pessoa.idade)
        alturaLabel.text = String(pessoa.altura)
    }

}

//var vc = DetalheDaPessoaViewController()
//vc.pessoa = Pessoa(nome: <#T##String#>, altura: <#T##Double#>, idade: <#T##Int#>)
