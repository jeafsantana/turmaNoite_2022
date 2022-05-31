//
//  ViewController.swift
//  correcao_MVVM
//
//  Created by Jessica Santana on 30/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cpfTextField: UITextField!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var alturaLabel: UILabel!
    
    let viewModel = PesquisaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

    @IBAction func pesquisarButtonAction(_ sender: Any) {
        viewModel.pesquisar(
            com: cpfTextField.text
        )
    }
    
    private func exibirAlerta() {
        let alerta = UIAlertController(title: "Erro no formato do CPF", message: "O CPF inserido no campo de texto é inválido", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default)
        
        alerta.addAction(action)
        
        present(alerta, animated: true)
    }
    
    private func exibirAlertaNoFormatoDeBottomSheet() {
        let alerta = UIAlertController(title: "Erro no formato do CPF", message: "O CPF inserido no campo de texto é inválido", preferredStyle: .actionSheet)
        
        let actionDefault = UIAlertAction(title: "Ok Default", style: .default)
        
        let actionCancel = UIAlertAction(title: "Ok Cancel", style: .cancel, handler: { action in
            print("ActionCancel")
        })
        
        let actionDestructive = UIAlertAction(
            title: "Ok Destructive",
            style: .destructive) { action in
                print("actionDestructive")
            }
        
        alerta.addAction(actionDefault)
        alerta.addAction(actionCancel)
        alerta.addAction(actionDestructive)
        
        present(alerta, animated: true)
    }
}

extension ViewController: PesquisaViewModelDelegate {
    
    func exibeMensagemDeErro() {
        exibirAlertaNoFormatoDeBottomSheet()
    }
    
    func exibeCaracteristicasDa(pessoa: Pessoa) {
        nomeLabel.text = pessoa.name
        enderecoLabel.text = pessoa.adress
        idadeLabel.text = pessoa.age
        alturaLabel.text = pessoa.height
    }
    
}

