//
//  ViewController.swift
//  aula_segmentedControl
//
//  Created by Jessica Santana on 02/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selecionouSegmentedControl(_ sender: Any) {
        let segmentoSelecionado = segmentedControl.selectedSegmentIndex
        
//        if segmentoSelecionado == 0 { segmentoLabel.text = "Primeiro" }
//        if segmentoSelecionado == 1 { segmentoLabel.text = "Segundo" }
//        if segmentoSelecionado == 2 { segmentoLabel.text = "Terceiro" }
        segmentoLabel.text = tituloDoSegmento(index: segmentoSelecionado)
        

    }
    
    private func tituloDoSegmento(index: Int) -> String {
        var titulo: String = ""
        
        switch index {
        case 0:
            titulo = "Primeiro"
        case 1:
            titulo = "Segundo"
        case 2:
            titulo = "Terceiro"
        default:
            print("caso nao tratado")
            break
        }
        
        return titulo
    }
    
}

