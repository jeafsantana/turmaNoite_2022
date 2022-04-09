//
//  ViewController.swift
//  correcaoTextFields
//
//  Created by Jessica Santana on 06/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeTextField.delegate = self
        cpfTextField.delegate = self
        telefoneTextField.delegate = self
        emailTextField.delegate = self
    }
    
//    nome nao pode ser nulo (nil) e tb nao pode ser vazio ("")
    func validaNome(string: String?) -> Bool {
        guard let string = string else { return false }
        
        return string != ""
    }
    
    //cpf nao pode ser nulo (nil), nao pode ser vazio (""), precisa ser so numeros, e precisa ter 11 digitos
    //o telefone nao pode ser nulo(nil), nao pode ser vazio (""), precisa ser so numeros e precisa ter 11 digitos
    func validaCPFECelular(string: String?) -> Bool {
        guard let string = string else { return false }
        
        return string != "" && Int(string) != nil && string.count == 11
    }
    
    func validaEmail(string: String?) -> Bool {
        guard let string = string else { return false }
    
        return string.contains("@")
    }
    
    func atualizaBordaTextField(ehBordaVermelha: Bool, textField: UITextField) {
        if ehBordaVermelha {
            // pintar de vermelho
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            // pintar da cor padrao
            textField.layer.borderWidth = 0
            textField.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == cpfTextField {
            let ehNomeValido = validaNome(string: nomeTextField.text)
            atualizaBordaTextField(ehBordaVermelha: !ehNomeValido, textField: nomeTextField)
            
            // pra que eu possa digitar o meu cpf, o campo de nome tem que ter sido preenchido
            // entao, nome nao pode ser nulo (nil) e tb nao pode ser vazio ("")
            if !ehNomeValido {
                return false
            }
        }
        
        if textField == telefoneTextField {
            // pra que eu possa digitar no campo de telefone, o campo de cpf tem que ter sido preenchido
            // entao, cpf nao pode ser nulo (nil), nao pode ser vazio (""), precisa ser so numeros, e precisa ter 11 digitos
            
//            if cpfTextField.text == nil || cpfTextField.text == "" {
//                if let text = cpfTextField.text {
//                    let numerosCpf = Int(text)
//                    if numerosCpf == nil || cpfTextField.text?.count != 11 {
//                        return false
//                    }
//                }
//                return false
//            }
            
            if validaCPFECelular(string: cpfTextField.text) == false {
                atualizaBordaTextField(ehBordaVermelha: true, textField: cpfTextField)
                return false
            }
            atualizaBordaTextField(ehBordaVermelha: false, textField: cpfTextField)
        }
        
        if textField == emailTextField {
            
            // pra que eu possa digitar no campo de email, o campo de telefone tem que ter sido preenchido
            //entao, o telefone nao pode ser nulo(nil), nao pode ser vazio (""), precisa ser so numeros e precisa ter 11 digitos
            
            if validaCPFECelular(string: telefoneTextField.text) == false {
                atualizaBordaTextField(ehBordaVermelha: true, textField: telefoneTextField)
                return false
            }
            atualizaBordaTextField(ehBordaVermelha: false, textField: telefoneTextField)

        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            if !validaEmail(string: textField.text) {
                atualizaBordaTextField(ehBordaVermelha: true, textField: emailTextField)
                return false
            }
            atualizaBordaTextField(ehBordaVermelha: false, textField: emailTextField)
        }
        return true
    }
}

