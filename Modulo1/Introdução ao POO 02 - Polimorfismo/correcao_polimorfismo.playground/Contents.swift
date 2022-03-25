import UIKit

class Funcionario {
    let nome: String
    var salario: Double
    private let cpf: String
    let valorSalarioAnual: Double
    
    init(nome: String, salario: Double, cpf: String) {
        self.nome = nome
        self.salario = salario
        self.valorSalarioAnual = salario * 12
        self.cpf = cpf
    }
    
    func calculaValorBonus() -> Double {
        // 5%
        return valorSalarioAnual * 0.05
    }
}



class Programador: Funcionario {
    var plataformaDeTrabalho: String
    
    init(plataformaDeTrabalho: String, nome: String, salario: Double, cpf: String) {
        self.plataformaDeTrabalho = plataformaDeTrabalho
        super.init(nome: nome, salario: salario, cpf: cpf)
    }
    
    override func calculaValorBonus() -> Double {
        // 20%
        return valorSalarioAnual * 0.20
    }
    
}

let programador = Programador(plataformaDeTrabalho: "iOS", nome: "Adriano", salario: 10000, cpf: "000.000.000-00") // 20%
//programador.nome


class Designer: Funcionario {
    var ferramentaPreferida: String
    
    init(ferramentaPreferida: String, nome: String, salario: Double, cpf: String) {
        self.ferramentaPreferida = ferramentaPreferida
        super.init(nome: nome, salario: salario, cpf: cpf)
    }
    
    override func calculaValorBonus() -> Double {
        // 15%
        let valorSalarioAnual = salario * 12
        return valorSalarioAnual * 0.15
    }
}

//let programador = Programador(


class Veiculo {
    var cor: String
    var preco: Double
    var quantidadeDePassageiros: Int
    
    init(cor: String, preco: Double, quantidadeDePassageiros: Int) {
        self.cor = cor
        self.preco = preco
        self.quantidadeDePassageiros = quantidadeDePassageiros
    }
    
    func quantidadeDeCombustivel(distanciaEmKM: Double) -> Double {
        return distanciaEmKM * preco
    }
    
}

let veiculo1: Veiculo = Veiculo(cor: "vermelho", preco: 12000, quantidadeDePassageiros: 4)

class Carro: Veiculo {
    var tamanhoDasRodas: Double
    
    init(tamanhoDasRodasParametro: Double, corParametro: String, precoParametro: Double, quantidadeDePassageirosParametro: Int) {
        self.tamanhoDasRodas = tamanhoDasRodasParametro
        super.init(cor: corParametro, preco: precoParametro, quantidadeDePassageiros: quantidadeDePassageirosParametro)
    }
    
    override func quantidadeDeCombustivel(distanciaEmKM: Double) -> Double {
        return tamanhoDasRodas * Double(quantidadeDePassageiros) * distanciaEmKM
    }
}

let carro1: Carro = Carro(tamanhoDasRodasParametro: 12.5, corParametro: "azul", precoParametro: 14000, quantidadeDePassageirosParametro: 4)

class Aviao: Veiculo {
    var piloto: String
    var companhiaAerea: String
    
    init(piloto: String, companhiaAerea: String, corParametro: String, precoParametro: Double, quantidadeDePassageirosParametro: Int) {
        self.piloto = piloto
        self.companhiaAerea = companhiaAerea
        super.init(cor: corParametro, preco: precoParametro, quantidadeDePassageiros: quantidadeDePassageirosParametro)
    }
    
    override func quantidadeDeCombustivel(distanciaEmKM: Double) -> Double {
        return Double(quantidadeDePassageiros) * distanciaEmKM
    }
}
