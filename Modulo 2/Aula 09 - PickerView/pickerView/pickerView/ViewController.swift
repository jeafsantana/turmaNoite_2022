//
//  ViewController.swift
//  pickerView
//
//  Created by Jessica Santana on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let nomes = ["Joao", "Maria", "Jose", "Roberto"]
    let nomesInvertido = ["Roberto", "Jose", "Maria", "Joao"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }


}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            print("nome selecionado: \(nomes[row])")
        case 1:
            print("nome Invertido selecionado: \(nomesInvertido[row])")
        default:
            return
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
           return nomes[row]
        case 1:
           return nomesInvertido[row]
        default:
            return nil
        }
        
//        return nomes[row]
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return nomes.count
        case 1:
            return nomesInvertido.count
        default:
//            break
            return 0
        }
        
//        return 0
//        return nomes.count
    }
}

