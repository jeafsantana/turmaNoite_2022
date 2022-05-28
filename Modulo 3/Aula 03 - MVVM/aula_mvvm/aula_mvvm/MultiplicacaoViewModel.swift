//
//  MultiplicacaoViewModel.swift
//  aula_mvvm
//
//  Created by Jessica Santana on 23/05/22.
//

import Foundation

protocol MultiplicacaoDelegate {
    func exibe(resultadoMultiplicacao: String)
}

class MultiplicacaoViewModel {
    
     var delegate: MultiplicacaoDelegate?
    
    func multiplicar(primeiroElemento: String?, segundoElemento: String?)  {
        
        if let primeiroElemento = primeiroElemento, let primeiroElementoNumerico = Int(primeiroElemento) {
            if let segundoElemento = segundoElemento, let segundoElementoNumerico = Int(segundoElemento) {
               
                let resultadoMultiplicacao = primeiroElementoNumerico * segundoElementoNumerico
                
                delegate?.exibe(resultadoMultiplicacao: "\(resultadoMultiplicacao)")
                
                return
            }
            // nao consegui fazer a multiplicacao por causa do segundo elemento
        }
        // nao consegui fazer a multiplicacao por causa do primeiro elemento
    }
    
}
