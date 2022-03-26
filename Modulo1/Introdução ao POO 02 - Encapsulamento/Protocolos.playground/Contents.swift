import UIKit

protocol Dirigivel {
    func acelerar()
    func freiar()
    func testeComRetorno() -> Bool
    func testeComParametro(parametroTeste: String)
}

class Automovel {
    
}

class Moto: Automovel, Dirigivel {
    func testeComParametro(parametroTeste: String) {
        <#code#>
    }
    
    func acelerar() {
        <#code#>
    }
    
    func freiar() {
        <#code#>
    }
    
    func testeComRetorno() -> Bool {
        <#code#>
    }

}
