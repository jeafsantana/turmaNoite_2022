//
//  FilmeViewModel.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 01/06/22.
//

import Foundation

class FilmeViewModel {
    private let filme: Filme
    
    // variavel computada
    
    init(filme: Filme) {
        self.filme = filme
    }
    
    func getNome() -> String {
        let nome = removerHifenDoNomeSeNecessario()
        return nome
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
