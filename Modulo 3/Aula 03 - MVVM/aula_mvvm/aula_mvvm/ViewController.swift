//
//  ViewController.swift
//  aula_mvvm
//
//  Created by Jessica Santana on 23/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var primeiroElementoTextField: UITextField!
    @IBOutlet weak var segundoElementoTextField: UITextField!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    let viewModel = MultiplicacaoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }


    @IBAction func multiplicarButtonAction(_ sender: Any) {
        
        let primeiroElemento = primeiroElementoTextField.text
        
        if let primeiroElemento = primeiroElemento {
            let numero = Int(primeiroElemento) // operacao logica

        }
        
        viewModel.multiplicar(
            primeiroElemento: primeiroElementoTextField.text,
            segundoElemento: segundoElementoTextField.text
        )
        
        // verificar se o primeiroElementoTextField é um número
        // Se nao for, pintar a borda de vermelho
        
        // verfificar se o segundoElementoTextField é um número
        // se nao for, pintar borda de vermelho
        
        
        // realizar a multiplicaçao e exibir no resultadoLabel
        
    }
}

extension ViewController: MultiplicacaoDelegate {
   
    func exibe(resultadoMultiplicacao: Int) {
        resultadoLabel.text = "\(resultadoMultiplicacao)"
    }
    
    
}

