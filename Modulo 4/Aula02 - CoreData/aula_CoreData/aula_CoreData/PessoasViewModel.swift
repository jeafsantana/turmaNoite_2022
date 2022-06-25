//
//  PessoasViewModel.swift
//  aula_CoreData
//
//  Created by Jessica Santana on 24/06/22.
//

import Foundation

protocol PessoasViewModelDelegate {
    func atualizarLista()
}

class PessoasViewModel {
    
    var delegate: PessoasViewModelDelegate?
    
    var quantidadeDePessoas2: Int {
        pessoas.count
    }
    
    private var pessoas: [Pessoa] = []
    
    private let coreDataService: CoreDataService = .init()
//    private let coreDataService = CoreDataService()
    
    func iniciouOAplicativo() {
        atualizaListaDePessoas()
    }
    
    func adicionarPessoa(nome: String?, idade: String?) {
        
        guard let idade = idade,
              let idadeConvertida = Int16(idade)
        else { return }
        
        coreDataService.adicionarPessoaNoCoreData(
            nome: nome,
            idade: idadeConvertida
        )
        
        atualizaListaDePessoas()
    }
    
    private func atualizaListaDePessoas() {
        pessoas = coreDataService.pegarListaDePessoasNoCoreData()
        
        delegate?.atualizarLista()
    }
    
    func quantidadeDePessoas() -> Int {
        return pessoas.count
    }
    
    func pegarNomeEIdade(posicao: Int) -> String {
        guard let nome = pessoas[posicao].nome else { return "" }
        return "\(nome) - \(pessoas[posicao].idade)"
    }
    
}
