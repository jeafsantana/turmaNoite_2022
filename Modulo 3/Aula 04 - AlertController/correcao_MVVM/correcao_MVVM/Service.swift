//
//  Service.swift
//  correcao_MVVM
//
//  Created by Jessica Santana on 30/05/22.
//

import Foundation

class Service {
    
    func pegarPessoaComClosureAPartirDe(cpf: String, completion: @escaping (Pessoa?) -> Void) {
        // nessa funçao, vou buscar na minha lista de pessoas
        // uma pessoa que possua o mesmo cpf que recebi por parametro
        // se encontrar, retorno essa pessoa, senao nulo
        
        let pessoas = listaDePessoas()
        
        var pessoaEncontrada: Pessoa? = nil
        
        for pessoa in pessoas {
            if pessoa.cpf == cpf {
                pessoaEncontrada = pessoa
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(pessoaEncontrada)
        }
    }
    
    func pegarPessoaAPartirDe(cpf: String) -> Pessoa? {
        // nessa funçao, vou buscar na minha lista de pessoas
        // uma pessoa que possua o mesmo cpf que recebi por parametro
        // se encontrar, retorno essa pessoa, senao nulo
        
        let pessoas = listaDePessoas()
        
        for pessoa in pessoas {
            if pessoa.cpf == cpf {
                return pessoa
            }
        }
        return nil
    }
    
    private func listaDePessoas() -> [Pessoa] {
        return [
            Pessoa(
                cpf: "12345678900",
                name: "Jessica",
                adress: "Rua Sapeca",
                age: 30,
                height: 180
            ),
            Pessoa(
                cpf: "12345678901",
                name: "Adriano",
                adress: "Rua Sapeca",
                age: 30,
                height: 180
            ),
            Pessoa(
                cpf: "12345678902",
                name: "Jean",
                adress: "Rua Sapeca",
                age: 30,
                height: 180
            ),
            Pessoa(
                cpf: "12345678903",
                name: "Alex",
                adress: "Rua Sapeca",
                age: 30,
                height: 180
            ),
            Pessoa(
                cpf: "12345678904",
                name: "Fernanda",
                adress: "Rua Sapeca",
                age: 30,
                height: 180
            ),
            Pessoa(
                cpf: "12345678905",
                name: "Rodrigo",
                adress: "Rua Sapeca",
                age: 30,
                height: 180
            ),
        ]
    }
    
}
