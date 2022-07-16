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
    func exibeAlertaDePiadaRepetida()
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
            self.validarPiada(piada)
        }
    }
    
    func exibirPiada(posicao: Int) {
        let piada = listaDePiadasSalvas[posicao]
        
        configuraPiada(piada)
    }
    
    // MARK: métodos privados
    
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
    
    // verificar se a piada já foi sorteada
    // se já foi sorteada, avisamos ao usuário com um alerta
    // senao, seguimos as etapas anteriores
    private func validarPiada(_ piada: Piada) {
        let aPiadaEstaNaLista =  listaDePiadasSalvas.contains { piadaDaLista in
            piadaDaLista.id == piada.id
        }
        
        if aPiadaEstaNaLista {
            delegate?.exibeAlertaDePiadaRepetida()
            return
        }
        
        exibePiada(piada)
    }
    
    private func exibePiada(_ piada: Piada) {
        configuraPiada(piada)
        
        // salvar a piada na lista de piadas salvas
        // exibir a nova piada salva na tableview
        listaDePiadasSalvas.append(piada)
        delegate?.recarregaDados()
        
        // salvar a lista de piadas no coreData
        
        coreDataService.adicionarPiadaNoCoreData(piada: piada)
    }
    
    private func configuraPiada(_ piada: Piada) {
        // exibir a piada na view
        // ver qual é o tipo da piada, se é twoparts ou single
        // decidir se vou sumir ou fazer aparecer o campo da segunda parte da piada
        
        if piada.tipo == TipoDePiada.simples.rawValue {
            
            guard let joke = piada.joke else { return }
            
            delegate?.exibePiadaSimples(descricaoDaPiada: joke)
            
        }
        
        if piada.tipo == TipoDePiada.dupla.rawValue {
            guard let setup = piada.setup,
                  let delivery = piada.delivery else { return }
            
            delegate?.exibePiadaDupla(
                primeiraParteDaPiada: setup,
                segundaParteDaPiada: delivery
            )

        }
    }
    
}
