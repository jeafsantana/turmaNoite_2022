//
//  PesquisaViewModel.swift
//  correcao_MVVM
//
//  Created by Jessica Santana on 30/05/22.
//

import Foundation

protocol PesquisaViewModelDelegate {
    func exibeMensagemDeErro()
    func exibeCaracteristicasDa(pessoa: Pessoa)
}

class PesquisaViewModel {
    
    var delegate: PesquisaViewModelDelegate?
    
    private let service: Service = Service()
    
    func pesquisar(com cpf: String?)  {
        // pode ser o cpf correto
            // vou e busco na minha lista de cpfs para ver se existe
                // pode ser que o cpf nao exista na lista
                // pode ser que o cpf exista na lista
        
        guard validarCPF(cpf) else {
            delegate?.exibeMensagemDeErro()
            return
        }
                
        // eu sei que o cpf é válido
        
        service.pegarPessoaComClosureAPartirDe(cpf: cpf!) { pessoa in
            if let pessoa = pessoa {
                self.delegate?.exibeCaracteristicasDa(pessoa: pessoa)
            } else {
                self.delegate?.exibeMensagemDeErro()
            }
        }
        
        
//        let pessoa = service.pegarPessoaAPartirDe(cpf: cpf!)
//
//        if let pessoa = pessoa {
//            delegate?.exibeCaracteristicasDa(pessoa: pessoa)
//        } else {
//            delegate?.exibeCampoDeErro()
//        }
        
        
        
//        if let cpf = cpf { // verificar se nao é nulo
//            if let cpfNumerico = Int(cpf) { // se é numérico
//                if cpf.count == 11 { // se tem 11 digitos
//                // meu cpf é válido
//                    return
//                }
//            }
//        }
        
        // pintar a borda
        
        
        // pode vir uma string vazia
            // vamos pintar a borda de vermelho
        
        // pode vir nulo
            // vamos pintar a borda de vermelho

        // pode vir uma quantidade invalida de digitos
            // vamos pintar a borda de vermelho

        // pode vir um caractere que nao é um numero
            // vamos pintar a borda de vermelho
    }
    
    private func validarCPF(_ cpf: String?) -> Bool {
        if let cpf = cpf, Int(cpf) != nil {
            if cpf.count == 11 {
                return true
            }
        }
        return false
    }
}
