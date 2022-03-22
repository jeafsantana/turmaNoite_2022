import UIKit


class Pessoa {
    let nome: String
    
    init(nome: String) {
        self.nome = nome
    }
    
    func comer() {
        print("comer hamburguer")
    }
    
}

let jess = Pessoa(nome: "Jessica")
print("Alimento da pessoa")
jess.comer()

// padeiro e um pediatra

class Padeiro: Pessoa {
    var especialidade: String
    
    init(especialidade: String, nome: String) {
        self.especialidade = especialidade
        super.init(nome: nome)
    }
    
    override func comer() {
        print("comer pão")
        super.comer()
    }
    
}

let padeiro = Padeiro(especialidade: "Sonho", nome: "Jessica")
print("Alimento do padeiro")
padeiro.comer()

class Pediatra: Pessoa {
    var idade: Int
    
    init(idade: Int, nome: String) {
        self.idade = idade
        super.init(nome: nome)
    }
    
    override func comer() {
        print("comer doce")
        super.comer()
    }
    
}

let pediatra = Pediatra(idade: 30, nome: "Rafael")
print("Alimento do pediatra")
pediatra.comer()


//let listaPessoas: [Pessoa] = [padeiro, pediatra]
//let listaPadeiros: [Padeiro] = [padeiro]
//
//let dic: [Int: Pessoa] = [0: padeiro, 1: pediatra]

