//
//  PiadaViewModel.swift
//  aulaNetwork
//
//  Created by Jessica Santana on 13/06/22.
//

import Foundation

protocol PiadaViewModelDelegate {
    func atualizaAsDuasPartesDaPiada(primeiraParte: String, segundaParte: String)
    func atualizaUmaParteDaPiada(primeiraParte: String)
}

class PiadaViewModel {
    
    private enum TipoDaPiada: String {
        case single = "single"
        case twoParts = "twopart"
    }
    
    private let servico: Servico
    private var piada: Piada?
    
    var delegate: PiadaViewModelDelegate?
    
    init(servico: Servico = .init()) {
        self.servico = servico
    }
    
    func carregouTela() {
        carregaPiada()
    }
    
    func botaoDeGerarNovaPiadaPressionado() {
        carregaPiada()
        
        // fazer a requisicao pro servico para pegar uma nova piada e devolver para a viewcontroller para ela atualizar a view com a piada nova
    }
    
    func deveEsconderSegundaParteDaPiada() -> Bool {
        guard let piada = piada else { return false }
        
        let tipoDaPiada = TipoDaPiada(rawValue: piada.type)
        
        switch tipoDaPiada {
        case .single:
            return true
        case .twoParts:
            return false
        case .none:
            return false
        }
    }
    
    private func carregaPiada() {
        servico.realizarRequisicaoDePiada {
            piada in
            self.piada = piada
            self.atualizaPiada(piada)
        }
    }
    
    private func atualizaPiada(_ piada: Piada) {
        if piada.type == "single" {
            // só tem uma parte
            //            guard let primeiraParteDaPiada = piada.joke else { return }
            //
            //            delegate?.atualizaUmaParteDaPiada(
            //                primeiraParte: primeiraParteDaPiada
            //            )
            atualizaUmaParteDaPiada(piada)
        } else {
            // tem duas partes
            
            //            guard let primeiraParteDaPiada = piada.setup,
            //                  let segundaParteDaPiada = piada.delivery
            //            else { return }
            //
            //            delegate?.atualizaAsDuasPartesDaPiada(
            //                primeiraParte: primeiraParteDaPiada,
            //                segundaParte: segundaParteDaPiada
            //            )
            atualizaAsDuasPartesDaPiada(piada)
        }
    }
    
    private func atualizaPiada2(_ piada: Piada) {
        let tipoDaPiada = TipoDaPiada(rawValue: piada.type)
        
        switch tipoDaPiada {
        case .single:
            atualizaUmaParteDaPiada(piada)
        case .twoParts:
            atualizaAsDuasPartesDaPiada(piada)
        case .none:
            break
        }
    }
    
    private func atualizaUmaParteDaPiada(_ piada: Piada) {
        guard let primeiraParteDaPiada = piada.joke else { return }
        
        delegate?.atualizaUmaParteDaPiada(
            primeiraParte: primeiraParteDaPiada
        )
    }
    
    private func atualizaAsDuasPartesDaPiada(_ piada: Piada) {
        guard let primeiraParteDaPiada = piada.setup,
              let segundaParteDaPiada = piada.delivery
        else { return }
        
        delegate?.atualizaAsDuasPartesDaPiada(
            primeiraParte: primeiraParteDaPiada,
            segundaParte: segundaParteDaPiada
        )
    }
    
}
