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
    private var listaDeFilmesFavoritos: [Filme] = []
    
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
    
    func getDetalheDoFilmeViewModel(posicao: Int?) -> DetalheDoFilmeViewModel? {
        guard let posicao = posicao else { return nil }
        
        let filmeSelecionado = listaDeFilmes[posicao] // filme da jessica
        
        let ehFavorito = listaDeFilmesFavoritos.contains { filmeFavorito in
            return filmeSelecionado.nome == filmeFavorito.nome
        }
        
        let detalheDoFilmeViewModel = DetalheDoFilmeViewModel(filme: filmeSelecionado, ehFavorito: ehFavorito)
        detalheDoFilmeViewModel.favoritoDelegate = self
        
        return detalheDoFilmeViewModel
        
        
        //        if let posicao = posicao {
        //            let filme = listaDeFilmes[posicao]
        //            let detalheDoFilmeViewModel = DetalheDoFilmeViewModel(filme: filme)
        //            return detalheDoFilmeViewModel
        //        }
        //
        //        return nil
    }
    
}

extension FilmesViewModel: FavoritoDelegate {
    func adicionarNosFavoritos(filme: Filme) {
        listaDeFilmesFavoritos.append(filme)
    }
    
    func removerDosFavoritos(filme: Filme) {
        listaDeFilmesFavoritos.removeAll { filmeFavorito in
            return filme.nome == filmeFavorito.nome
        }
    }
}
