//
//  FilmesViewModel.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 01/06/22.
//

import Foundation

protocol FilmesViewModelDelegate {
    func recarregaDados()
}

class FilmesViewModel {
    
    var quantidadeDeFilmes: Int = 0
    var delegate: FilmesViewModelDelegate?
    
    private var listaDeFilmes: [Filme] = []
    private let service = Service()
        
    func buscaFilmes() {
        service.getListaDeFilmes(somaUm: {
            batata in
            // eu tenho meu array de filmes
            self.quantidadeDeFilmes = batata.count
            self.listaDeFilmes = batata
            
            self.delegate?.recarregaDados()
        })
    }
    
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = listaDeFilmes[posicao]
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
}
