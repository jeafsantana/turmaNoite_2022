//
//  DetalheDoFilmeViewModel.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 03/06/22.
//

import Foundation

protocol FavoritoDelegate {
    func adicionarNosFavoritos(filme: Filme)
    func removerDosFavoritos(filme: Filme)
}
 
protocol DetalheDoFilmeViewModelDelegate {
    func alteraTituloDoBotaoDeFavorito()
    func exibeAlertaDeFavoritar()
    func exibeAlertaDeDesfavoritar()
}

class DetalheDoFilmeViewModel {
    
    private let filme: Filme
    private var ehFavorito: Bool
    
    var favoritoDelegate: FavoritoDelegate?
    var delegate: DetalheDoFilmeViewModelDelegate?
    
    // variavel computada
    
    init(filme: Filme, ehFavorito: Bool) {
        self.filme = filme
        self.ehFavorito = ehFavorito
    }
    
    func getNome() -> String {
        let nome = removerHifenDoNomeSeNecessario()
        return nome
    }
    
    func getPoster() -> String {
        return filme.poster
    }
     
    func getAno() -> String {
        return String(filme.ano)
    }
    
    func getGenero() -> String {
        return filme.genero
    }
    
    func getFavoritoButtonTitle() -> String {
        if ehFavorito {
            return "Desfavoritar!"
        } else {
            return "Favoritar!"
        }
    }
    
    func selecionouNoBotaoDeFavorito() {
        if ehFavorito {
            delegate?.exibeAlertaDeDesfavoritar()
        } else {
            delegate?.exibeAlertaDeFavoritar()
        }
    }
    
    func adicionarFilmeAosFavoritos() {
        favoritoDelegate?.adicionarNosFavoritos(filme: filme)
        ehFavorito = true
        
        delegate?.alteraTituloDoBotaoDeFavorito()
    }
    
    func removerFilmeDosFavoritos() {
        favoritoDelegate?.removerDosFavoritos(filme: filme)
        ehFavorito = false
        
        delegate?.alteraTituloDoBotaoDeFavorito()
    }
    
    private func removerHifenDoNomeSeNecessario() -> String {
        var tituloFilme = filme.nome

        if tituloFilme.contains("-") {
            tituloFilme.removeLast()
            return tituloFilme
        }
        
        return tituloFilme
    }
    
}
