//
//  Service.swift
//  correcao_desafioAlert
//
//  Created by Jessica Santana on 01/06/22.
//

import Foundation

class Service {
    
    private let filmes: [Filme] = [
        Filme(
            poster: "aladin",
            nome: "Aladdin-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "cruella",
            nome: "Cruella-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "doisIrmaos",
            nome: "Dois Irmaos-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "drestranho",
            nome: "Dr Estranho-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "encanto",
            nome: "Encanto-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "luca",
            nome: "Luca-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "obomdinossauro",
            nome: "O Bom Dinossauro-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "pocahontas",
            nome: "Pocahontas-",
            ano: 2000,
            genero: "Animaçao"
        ),
        Filme(
            poster: "soul",
            nome: "Soul-",
            ano: 2000,
            genero: "Animaçao"
        )
    ]
    
    func getListaDeFilmes(somaUm: @escaping ([Filme]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            // informar a lista de filmes
            somaUm(self.filmes)
        })
    }
    
}
