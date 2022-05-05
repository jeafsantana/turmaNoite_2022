//
//  ViewController.swift
//  datePicker
//
//  Created by Jessica Santana on 04/05/22.
//

import UIKit

enum TiposDeDocumento{
    case CNH
    case RG
    case TituloDeEleitor
    case Passaporte
}

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var tipoDeDocumento: TiposDeDocumento = .RG

    override func viewDidLoad() {
        super.viewDidLoad()
        tipoDeDocumento = TiposDeDocumento.CNH
    }

    @IBAction func datePickerMudouDeValor(_ sender: Any) {
        let dataEHora = datePicker.date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC-3")
        
        let stringData = dateFormatter.string(from: dataEHora)
        print("Minha data formatada é: \(stringData)")
        
        print("Mudou o valor da data - \(dataEHora)")
    }
    
}

