//
//  ViewController.swift
//  correcaoPickerView
//
//  Created by Jessica Santana on 09/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cronometroPickerView: UIPickerView!
    @IBOutlet weak var informacaoCronometroLabel: UILabel!
    
    var horas: [String] = []
    var minutos: [String] = []
    var segundos: [String] = []
    
    var valorHora: String = ""
    var valorMinuto: String = ""
    var valorSegundo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializaListas()
        
        cronometroPickerView.delegate = self
        cronometroPickerView.dataSource = self
        
        inicializaValoresSelecionadosNoPickerView()
    }
    
    // MARK: - Funçoes privadas
    
    private func inicializaListas() {
        // inicializa o array de horas
        horas = criaListaNumericaEmStringCom(limite: 24)
        
        // inicializa o array de minutos
        minutos = criaListaNumericaEmStringCom(limite: 60)
        
        // inicializa o array de segundos
        segundos = criaListaNumericaEmStringCom(limite: 60)
    }
    
    private func inicializaValoresSelecionadosNoPickerView() {
        valorHora = horas[0]
        valorMinuto = minutos[0]
        valorSegundo = segundos[0]
    }
    
    private func criaListaNumericaEmStringCom(limite: Int) -> [String] {
        var listaNumericaEmString: [String] = []
        
        for index in 0..<limite {
            let stringNumero = String(index)
            listaNumericaEmString.append(stringNumero)
        }
        
        return listaNumericaEmString
    }
    
    // MARK: - Actions dos botoes
    
    @IBAction func cancelarAction(_ sender: Any) {
        // a label debaixo deve ser zerada e voltar para o texto inicial
        informacaoCronometroLabel.text = "0 Horas, 0 min e 0 seg"
    }
    
    @IBAction func iniciarAction(_ sender: Any) {
        // a label debaixo deve estar escrita com a hora selecionada no pickerView
        informacaoCronometroLabel.text = "\(valorHora) Horas, \(valorMinuto) min e \(valorSegundo) seg"
    }
}

// MARK: - Delegate PickerView

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let casoDoCronometro = Cronometro(rawValue: component) else { return }

        if casoDoCronometro == .Horas {
            valorHora = horas[row]
        }
        
        if casoDoCronometro == .Minutos {
            valorMinuto = minutos[row]
        }
        
        if casoDoCronometro == .Segundos {
            valorSegundo = segundos[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let casoDoCronometro = Cronometro(rawValue: component) else { return nil }
        
        switch casoDoCronometro {
        case .Horas:
            return "\(horas[row]) horas"
        case .Minutos:
            return "\(minutos[row]) min"
        case .Segundos:
            return  "\(segundos[row]) seg"
        }
    }
    
}

// MARK: - Datasource PickerView

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Cronometro.cases.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let casoDoCronometro = Cronometro(rawValue: component)
                        
        switch casoDoCronometro {
        case .Horas:
            return horas.count
        case .Minutos:
            return minutos.count
        case .Segundos:
            return segundos.count
        case .none:
            return 0
        }
    }
}

enum Cronometro: Int {
    case Horas = 0
    case Minutos = 1
    case Segundos = 2
    
    static var cases: [Cronometro] = [.Horas, .Minutos, .Segundos]
}

