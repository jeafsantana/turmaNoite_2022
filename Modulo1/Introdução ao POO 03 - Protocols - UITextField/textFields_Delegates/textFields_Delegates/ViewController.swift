//
//  ViewController.swift
//  textFields_Delegates
//
//  Created by Jessica Santana on 30/03/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var exemploTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exemploTextField.delegate = self
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "a" { // não vou deixar o usuário digitar a
            textField.text = "\(textField.text)z"
            return false
        }
        return true
    }
}

