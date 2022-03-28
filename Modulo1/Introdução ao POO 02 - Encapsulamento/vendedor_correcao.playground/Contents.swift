import UIKit

public class Vendedor {
    public var nome: String
    public var idade: Int
    private let cpf: String
    private var saldoEmConta: Double
    private var brinde: String?
    
    init(nome: String, idade: Int, cpf: String, saldoEmConta: Double) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoEmConta = saldoEmConta
    }
    
    public func vender(quantidadeDePecas: Int, tipoDePeca: String) {
        var valorDaCompra: Double = 0.0
        
        if tipoDePeca == "Terno" {
            valorDaCompra = comprarTerno(quantidadeDePecas: quantidadeDePecas)
        }
        
        if tipoDePeca == "Vestido" {
            valorDaCompra = comprarVestido(quantidadeDePecas: quantidadeDePecas)
        }
        
        if tipoDePeca == "Boné" {
            valorDaCompra = comprarBone(quantidadeDePecas: quantidadeDePecas)
        }
        
        print("Efetuei uma venda de \(quantidadeDePecas) \(tipoDePeca)s e deu um valor total de R$\(valorDaCompra)!")
        
        if let brinde = brinde {
            print("O usuário ganhou de brinde: \(brinde)")
        }
        
        saldoEmConta += valorDaCompra
        
        print("O saldo em conta atual é de R$\(saldoEmConta)")
    }
    
    private func comprarTerno(quantidadeDePecas: Int) -> Double {
        var custoDaCompra = 400 * quantidadeDePecas
        
        if quantidadeDePecas >= 3 {
            let desconto = 50 * quantidadeDePecas
            custoDaCompra = custoDaCompra - desconto
        }
        
        return Double(custoDaCompra)
    }
    
    private func comprarVestido(quantidadeDePecas: Int) -> Double {
        let custoDaCompra = 900 * quantidadeDePecas
        
        if quantidadeDePecas == 5 {
            brinde = "Você ganhou um véu de noiva!"
        }
        return Double(custoDaCompra)
    }
    
    private func comprarBone(quantidadeDePecas: Int) -> Double {
        var custoDaCompra = 50 * quantidadeDePecas
        
        let quantidadeDeBonesExtras = quantidadeDePecas/3
        
        let desconto = 50 * quantidadeDeBonesExtras
        custoDaCompra = custoDaCompra - desconto
        
        if quantidadeDeBonesExtras > 0 {
            brinde = "Você ganhou \(quantidadeDeBonesExtras) bonés de brinde!"
        }
        
        return Double(custoDaCompra)

    }
}

let vendedor = Vendedor(nome: "Jessica", idade: 25, cpf: "00000000", saldoEmConta: 10)



vendedor.vender(quantidadeDePecas: 5, tipoDePeca: "Terno")
print("---------------------------------------------------")
vendedor.vender(quantidadeDePecas: 5, tipoDePeca: "Vestido")
print("---------------------------------------------------")
vendedor.vender(quantidadeDePecas: 5, tipoDePeca: "Boné")
