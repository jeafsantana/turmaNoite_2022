//
//  ViewController.swift
//  aulaMVVM_parte2
//
//  Created by Jessica Santana on 27/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var primeiroNumeroTextField: UITextField!
    @IBOutlet weak var segundoNumeroTextField: UITextField!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    let viewModel = SomaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }

    @IBAction func somarButtonAction(_ sender: Any) {
                
        // realizar uma soma
        
        viewModel.somar(
            primeiroValor: primeiroNumeroTextField.text,
            segundoValor: segundoNumeroTextField.text
        )
        
        // para realizar uma soma, os dois campos devem ser numéricos
        
        // o campo que nao for numérico, deve ficar com a borda vermellha
        
        // se o campo estiver vazio, deve ficar com a borda vermelha
        
        // depois de realizada a soma, o resultado deve ser apresentado
        // na label de resultado
        
        
    }
    
//    private func soma() -> Int
}

extension ViewController: SomaViewModelDelegate {
    func exibeResultado(_ resultadoSoma: String) {
        resultadoLabel.text = resultadoSoma
    }
}
