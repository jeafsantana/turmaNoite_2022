import UIKit
//
//class Gato {
//    let nome: String
//    let cor: String
//
//    init(nome: String, cor: String) {
//        self.nome = nome
//        self.cor = cor
//    }
//
//    func miar() -> String {
//        return "miau"
//    }
//
//    func comerPeixe() {
//        print("Comeu o peixe")
//    }
//}
//
//let gatoA = Gato(nome: "Tom", cor: "Branco")
//
//
//class Vaca {
//    let nome: String
//    let cor: String
//    var litrosDeLeiteProduzidosPorDia: Double
//
//    init(nome: String, cor: String, litrosDeLeiteProduzidosPorDia: Double) {
//        self.nome = nome
//        self.cor = cor
//        self.litrosDeLeiteProduzidosPorDia = litrosDeLeiteProduzidosPorDia
//    }
//
//    func mugir() -> String {
//        return "muuu"
//    }
//
//    func comerCapim() {
//        print("Comi capim")
//    }
//}


class Animal {
    let nome: String
    let cor: String
    
    init(nome: String, cor: String) {
        self.nome = nome
        self.cor = cor
    }
    
    func emitirSom() -> String {
        return "O animal emitiu um som"
    }
    
    func comer() {
        print("O animal está comendo algo")
    }
}

class Gato: Animal {
    override func comer() {
        print("O gato está comendo peixe")
    }
    
    override func emitirSom() -> String {
        return "Miau"
    }
}

class Vaca: Animal {
    var litrosDeLeiteProduzidos: Double
    
    init(litrosDeLeiteProduzidos: Double, nome: String, cor: String) {
        self.litrosDeLeiteProduzidos = litrosDeLeiteProduzidos
        super.init(nome: nome, cor: cor)
    }
    
    override func comer() {
        print("A vaca está comendo capim")
//        super.comer()
    }
    
    override func emitirSom() -> String {
        return "muuu"
    }
}

let tom = Gato(nome: "Tom", cor: "Branca")
tom.comer()
print(tom.emitirSom())

let vaca = Vaca(litrosDeLeiteProduzidos: 12.0, nome: "Rata", cor: "Cinza")
//print("Nome da vaca: \(vaca.nome)")
vaca.comer()
print(vaca.emitirSom())














