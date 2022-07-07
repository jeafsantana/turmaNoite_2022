//
//  PiadasViewModel.swift
//  coreData_revisao
//
//  Created by Jessica Santana on 06/07/22.
//

import Foundation

protocol PiadasViewModelDelegate {
    func exibePiadaSimples(descricaoDaPiada: String)
    func exibePiadaDupla(primeiraParteDaPiada: String, segundaParteDaPiada: String)
    func recarregaDados()
}

class PiadasViewModel {
    
    enum TipoDePiada: String {
        case simples = "single"
        case dupla = "twopart"
    }
    
    var quantidadeDePiadas: Int {
        listaDePiadasSalvas.count
    }
    
    var delegate: PiadasViewModelDelegate?
    
    private var listaDePiadasSalvas: [Piada] = []
    private let service: Service = .init()
//    private let service: Service = Service()
    private let coreDataService: CoreDataService = .init()
    
    init() {
        carregaListaDePiadasSalvas()
    }
    
    private func carregaListaDePiadasSalvas() {
        listaDePiadasSalvas = converterPiadasSalvas()
    }
    
    private func converterPiadasSalvas() -> [Piada] {
        let piadasSalvas = coreDataService.pegarListaDePiadasNoCoreData()
        
        var piadas: [Piada] = []
        
        for piada in piadasSalvas {
            let novaPiada = Piada(
                categoria: piada.categoria!,
                tipo: piada.tipo!,
                joke: piada.joke,
                setup: piada.setup,
                delivery: piada.delivery,
                id: Int(piada.id)
            )
            
            piadas.append(novaPiada)
        }
        return piadas
    }
    
    func carregarPrimeiraPiada() {
        sortearPiadaNova()
    }
    
    func getTitulo(posicao: Int) -> String {
        let piada = listaDePiadasSalvas[posicao]
        // id - categoria - tipo
        return "\(piada.id) - \(piada.categoria) - \(piada.tipo)"
    }
    
    func sortearPiadaNova() {
        
        service.getPiada { piada in
            self.configuraPiada(piada)
            
            // salvar a piada na lista de piadas salvas
            // exibir a nova piada salva na tableview
            self.listaDePiadasSalvas.append(piada)
            self.delegate?.recarregaDados()
            
            // salvar a lista de piadas no coreData
            
            self.coreDataService.adicionarPiadaNoCoreData(piada: piada)
            
        }
    }
    
    func exibirPiada(posicao: Int) {
        let piada = listaDePiadasSalvas[posicao]
        
        configuraPiada(piada)
    }
    
    private func configuraPiada(_ piada: Piada) {
        // exibir a piada na view
        // ver qual é o tipo da piada, se é twoparts ou single
        // decidir se vou sumir ou fazer aparecer o campo da segunda parte da piada
        
        if piada.tipo == TipoDePiada.simples.rawValue {
            
            guard let joke = piada.joke else { return }
            
            self.delegate?.exibePiadaSimples(descricaoDaPiada: joke)
            
        }
        
        if piada.tipo == TipoDePiada.dupla.rawValue {
            guard let setup = piada.setup,
                  let delivery = piada.delivery else { return }
            
            self.delegate?.exibePiadaDupla(
                primeiraParteDaPiada: setup,
                segundaParteDaPiada: delivery
            )

        }
    }
    
}
