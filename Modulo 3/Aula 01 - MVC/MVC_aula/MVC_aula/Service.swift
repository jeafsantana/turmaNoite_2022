//
//  Service.swift
//  MVC_aula
//
//  Created by Jessica Santana on 18/05/22.
//

import Foundation

class Service {
    // encontrar um certo cliente a partir de um cpf
    
    private func listaDeClientesQueOServidorConhece() -> [Cliente] {
        return [
            Cliente(nome: "Jessica", idade: 26, cpf: "000000", saldo: 100.0),
            Cliente(nome: "Matheus", idade: 27, cpf: "000001", saldo: 110.0),
            Cliente(nome: "Adriano", idade: 26, cpf: "000002", saldo: 120.0),
            Cliente(nome: "Marcelo", idade: 26, cpf: "000003", saldo: 130.0),
            Cliente(nome: "Bruno", idade: 26, cpf: "000004", saldo: 140.0),
            Cliente(nome: "André", idade: 26, cpf: "000005", saldo: 150.0),
            Cliente(nome: "Murilo", idade: 26, cpf: "000006", saldo: 160.0),
            Cliente(nome: "Jean", idade: 26, cpf: "000007", saldo: 170.0),
        ]
    }
    
    func pegarClienteAPartirDe(_ cpf: String) -> Cliente? {
        let clientes = listaDeClientesQueOServidorConhece()
        
        for cliente in clientes {
            if cliente.cpf == cpf {
                return cliente
            }
        }
        
        return nil
    }
    
}
