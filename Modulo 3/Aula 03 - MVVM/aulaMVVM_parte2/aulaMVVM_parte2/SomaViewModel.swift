//
//  SomaViewModel.swift
//  aulaMVVM_parte2
//
//  Created by Jessica Santana on 27/05/22.
//

import Foundation

protocol SomaViewModelDelegate {
    func exibeResultado(_ resultadoSoma: String)
}

class SomaViewModel {
    
    var delegate: SomaViewModelDelegate?
    
    func somar(primeiroValor: String?, segundoValor: String?) {
        
        if let primeiroValor = primeiroValor, let segundoValor = segundoValor {
            // nenhum dos dois sao nulos
            if let primeiroNumero = Int(primeiroValor), let segundoNumero = Int(segundoValor) {
                // ambos sao numéricos
                let resultadoSoma = primeiroNumero + segundoNumero
                delegate?.exibeResultado("\(resultadoSoma)")
            }
            
        }
        
    }
    
    func somarComRetorno(primeiroValor: String?, segundoValor: String?) -> String? {
        
        if let primeiroValor = primeiroValor, let segundoValor = segundoValor {
            // nenhum dos dois sao nulos
            if let primeiroNumero = Int(primeiroValor), let segundoNumero = Int(segundoValor) {
                // ambos sao numéricos
                let resultadoSoma = primeiroNumero + segundoNumero
                return "\(resultadoSoma)"
            }
            // A
        }
        return nil
    }
    
    func subtracaoComRetorno(primeiroValor: Int, segundoValor: Int) -> Int {
        return primeiroValor - segundoValor
    }
    
    
    func retornaListaPessoas(completion: @escaping (Int) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: <#T##DispatchTime#>, execute: <#T##() -> Void#>)
        
    }
    
    
}
