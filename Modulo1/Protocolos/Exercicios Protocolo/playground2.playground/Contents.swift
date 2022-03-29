import UIKit

protocol Voador {
    func voar()
}

class Pato: Voador {
    
    var energia = 4
    
    func voar() {
        energia -= 5
        
        if energia >= 0 {
            print("Estou voando como um pato")
        } else {
            print("Acabou a energia do pato")
        }
        
        print(energia)
    }
    
}

class Aviao: Voador {
    
    var horas = 0
    
    func voar() {
        horas += 13
        print("Estou voando como um avião")
    }
    
}

class SuperHomem: Voador {
    
    var experiencia = 0
    
    func voar() {
        experiencia = experiencia + 3
        print("Estou voando como um campeão")
    }
    
}

class TorreDeControle {
    private var voadores: [Voador] = []
    
    func voamTodos() {
        for voador in voadores {
            voador.voar()
        }
    }
    
    func adicionar(um voador: Voador) {
        voadores.append(voador)
    }
    
}

let marreco = Pato()
let tecoteco = Aviao()
let clarkKent = SuperHomem()
let torre = TorreDeControle()

torre.adicionar(um: marreco)
torre.adicionar(um: tecoteco)
torre.adicionar(um: clarkKent)

torre.voamTodos()
