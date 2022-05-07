//
//  ViewController.swift
//  correcaoDatePicker
//
//  Created by Jessica Santana on 06/05/22.
//

import UIKit

class Teste {
    var tipoDeDocumento: ViewController.TipoDeDocumento?
}

class ViewController: UIViewController {
    
    enum TipoDeDocumento {
        case RG
        case CPF
        case CNH
    }
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var tipoDeDocumento: TipoDeDocumento = .CNH
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func valorDoDatePickerMudou(_ sender: Any) {
        // se esse método for chamado, entao a data no datepicker mudou
        
//        let dataEHora = datePicker.date
//        print("Data e hora recebida pelo datepicker \(dataEHora)")
//
//        let dataEHoraFormatada = formataDataParaFormatoDeBrasilia(dataEHora)
//        print("Minha data formatada é: \(dataEHoraFormatada)")
        
        guard possuiTextFieldsValidos() else { return }

        updateLabels(
            nome: nomeTextField.text,
            telefone: telefoneTextField.text,
            data: formataDataParaFormatoDeBrasilia(datePicker.date)
        )
        
//        if possuiTextFieldsValidos() {
//            updateLabels(
//                nome: nomeTextField.text,
//                telefone: telefoneTextField.text,
//                data: formataDataParaFormatoDeBrasilia(datePicker.date)
//            )
//        }
        
        
//        nomeLabel.text = nomeTextField.text
//        telefoneLabel.text = telefoneTextField.text
//        dataLabel.text = dataEHoraFormatada
    }
    
    func possuiTextFieldsValidos() -> Bool {
        let nome = nomeTextField.text
        let telefone = telefoneTextField.text
        
        return nome != "" && telefone != ""
    }
    
    func updateLabels(nome: String?, telefone: String?, data: String) {
        nomeLabel.text = nome
        telefoneLabel.text = telefone
        dataLabel.text = data
    }
    
    func formataDataParaFormatoDeBrasilia(_ dataEHora: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
//        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC-3")
        
        let stringData = dateFormatter.string(from: dataEHora)
        
        return stringData
    }
    
}

