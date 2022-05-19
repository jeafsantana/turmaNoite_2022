//
//  Cliente.swift
//  MVC_aula
//
//  Created by Jessica Santana on 18/05/22.
//

import Foundation

class Cliente {
    var nome: String
    var idade: Int
    var cpf: String
    var saldo: Double
    
    init(nome: String, idade: Int, cpf: String, saldo: Double) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldo = saldo
    }
}
