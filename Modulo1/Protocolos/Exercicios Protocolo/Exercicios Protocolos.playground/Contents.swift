import UIKit

protocol Imprimivel {
    func imprimir()
}

class Contrato: Imprimivel {
    func imprimir() {
        print("Sou um contrato muito legal")
    }
}

class Foto: Imprimivel {
    func imprimir() {
        print("Sou uma selfie")
    }
}

class Documento: Imprimivel {
    func imprimir() {
        print("Sou um documento do Word")
    }
}

class Impressora {
    private var elementos: [Imprimivel] = []
    
    func imprimirTudo() {
        for elemento in elementos {
            elemento.imprimir()
        }
        
//        elementos.forEach { elemento in
//            elemento.imprimir()
//        }
    }
    
    func agregarImprimel(umImprimivel: Imprimivel) {
//        elementos.append(umImprimivel)
        elementos.insert(umImprimivel, at: 0)
    }
}

let contrato = Contrato()
let foto = Foto()
let documento = Documento()
let epson = Impressora()

epson.agregarImprimel(umImprimivel: contrato)
epson.agregarImprimel(umImprimivel: foto)
epson.agregarImprimel(umImprimivel: documento)

epson.imprimirTudo()
