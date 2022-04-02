//
//  ViewController.swift
//  textfield_delegates
//
//  Created by Jessica Santana on 01/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var exemplo1TextField: UITextField!
    @IBOutlet weak var exemplo2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        exemplo1TextField.delegate = self
        exemplo1TextField.clearButtonMode = .always
//        exemplo1TextField.tag
        exemplo2TextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 0 && string == "a" {
            //            exemplo1TextField.text = "\(exemplo1TextField.text)z"
            //            exemplo1TextField.text = "\(exemplo1TextField.text!)z"
            //            exemplo1TextField.text = "\(exemplo1TextField.text ?? "")z"
            
            //            guard let textoDesembrulhado = exemplo1TextField.text else {
            //                return false
            //            }
            //
            //            exemplo1TextField.text = "\(textoDesembrulhado)z"
            
            if let textoDesembrulhado = exemplo1TextField.text {
                exemplo1TextField.text = "\(textoDesembrulhado)z"
                //                    quantidadeDeLetrasZ = quantidadeDeLetrasZ + 1
            }
            
            return false
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            if text.contains("b") {
                return true
            }
        }
        return false
        
//        if textField.text?.contains("b") {
//
//        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            let quantidadeDeLetrasZs = contaQuantidadeDeZs()
            let ehMaiorDoQueTres = quantidadeDeLetrasZs > 3
            
            devePintarBordaDoTextField1(ehMaiorDoQueTres)
            exemplo2TextField.text = "A quantidade é \(quantidadeDeLetrasZs)"
            
            return false
        }
        return true
    }
    
    private func devePintarBordaDoTextField1(_ devePintar: Bool) {
        if devePintar {
            exemplo1TextField.layer.borderWidth = 1
            exemplo1TextField.layer.borderColor = UIColor.red.cgColor
        } else {
            exemplo1TextField.layer.borderWidth = 0
            exemplo1TextField.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    private func contaQuantidadeDeZs() -> Int {
        var contador = 0
        
        if let stringDoTextField1 = exemplo1TextField.text {
            for caractere in stringDoTextField1 {
                
                if String(caractere) == "z" {
                    contador += 1
                }
            }
        }
        return contador
    }
}

