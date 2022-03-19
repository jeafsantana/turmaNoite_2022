import UIKit

// criar uma modelagem de uma cadeira

// 1. Quais os atributos que definem uma cadeira?
// 2. Quais as ações que definem uma cadeira?

class Cadeira {
    
    let temEncosto: Bool = true
    let temAssento: Bool = true
    
    var temRodinha: Bool
    var temApoioDeBraco: Bool
    
    var estaOcupada: Bool = false
    
//    init(temRodinha: Bool, temApoioDeBraco: Bool) {
//        self.temRodinha = temRodinha
//        self.temApoioDeBraco = temApoioDeBraco
//    }
    
    init(temRodinhaParametro: Bool, temApoioDeBracoParametro: Bool) {
        temRodinha = temRodinhaParametro
        temApoioDeBraco = temApoioDeBracoParametro
    }
    
    // saber se eu consigo me sentar!
    // Verifico se a cadeira está ocupada ou não
    // Se estiver, eu não posso me sentar e aviso para a pessoa que tentou sentar (return false)
    // Se não estiver ocupada, então eu me sento e aviso para a pessoa que tentou sentar que ela conseguiu (return true)
    func sentar() -> Bool {
//        if estaOcupada == false {
//            estaOcupada = true
//            return true
//        } else {
//            return false
//        }
        
//        if !estaOcupada {
//            estaOcupada = true
//            return true
//        } else {
//            return false
//        }
        
        if !estaOcupada {
            estaOcupada = true
            return true
        }
        return false
    }
    
    func levantar() -> Bool {
        if estaOcupada {
            estaOcupada = false
            return true
        }
        return false
    }
    
}

// Objetos ( instâncias )

var cadeiraDeEscritorio = Cadeira(
    temRodinhaParametro: true,
    temApoioDeBracoParametro: true
)

print("primeira tentativa - A cadeira está ocupada? \(cadeiraDeEscritorio.estaOcupada)")

print(cadeiraDeEscritorio.sentar()) // true

print("segunda tentativa - A cadeira está ocupada? \(cadeiraDeEscritorio.estaOcupada)")

print(cadeiraDeEscritorio.sentar()) // false

print("terceira tentativa - A cadeira está ocupada? \(cadeiraDeEscritorio.estaOcupada)")

print(cadeiraDeEscritorio.levantar())

print("quarta tentativa - A cadeira está ocupada? \(cadeiraDeEscritorio.estaOcupada)")


var cadeira = Cadeira(
    temRodinhaParametro: false,
    temApoioDeBracoParametro: false
)

var cadeiraDePraia = Cadeira(
    temRodinhaParametro: false,
    temApoioDeBracoParametro: true
)

// lista de cadeiras - array de objetos

let cadeiras: [Cadeira] = [cadeiraDeEscritorio, cadeira, cadeiraDePraia]




