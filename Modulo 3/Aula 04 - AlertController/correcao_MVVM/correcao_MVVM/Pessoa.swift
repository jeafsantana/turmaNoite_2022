//
//  Pessoa.swift
//  correcao_MVVM
//
//  Created by Jessica Santana on 30/05/22.
//

import Foundation

class Pessoa {
    let cpf: String
    let name: String
    let adress: String
    let age: String
    let height: String
    
    init(cpf: String, name: String, adress: String, age: Int, height: Double) {
        self.cpf = cpf
        self.name = name
        self.adress = adress
        self.age = String(age)
        self.height = String(height)
    }
}
