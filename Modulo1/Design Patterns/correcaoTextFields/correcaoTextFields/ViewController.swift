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
    
    //cpf nao pode ser nulo (nil), nao pode ser vazio (""), precisa ser so numeros, e precisa ter 11 digitos
    //o telefone nao pode ser nulo(nil), nao pode ser vazio (""), precisa ser so numeros e precisa ter 11 digitos
    func validaCPFECelular(string: String?) -> Bool {
        guard let string = string else { return false }
        
        return string != "" && Int(string) != nil && string.count == 11
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == cpfTextField {
            // pra que eu possa digitar o meu cpf, o campo de nome tem que ter sido preenchido
            // entao, nome nao pode ser nulo (nil) e tb nao pode ser vazio ("")
            if nomeTextField.text == nil || nomeTextField.text == "" {
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
                return false
            }
        }
        
        if textField == emailTextField {
            
            // pra que eu possa digitar no campo de email, o campo de telefone tem que ter sido preenchido
            //entao, o telefone nao pode ser nulo(nil), nao pode ser vazio (""), precisa ser so numeros e precisa ter 11 digitos
            
            if validaCPFECelular(string: telefoneTextField.text) == false {
                return false
            }
        }
        
        
        return true
    }
    
    
    
}

