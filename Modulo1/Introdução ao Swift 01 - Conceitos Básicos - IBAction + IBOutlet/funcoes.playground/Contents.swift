import UIKit
// Funções:

//1.

func cumprimentarA(pessoa: String) {
    print(pessoa)
}

cumprimentarA(pessoa: "João")

func cumprimentar(a pessoa: String) {
    print(pessoa)
}

cumprimentar(a: "Fernanda")

func cumprimentarA(_ pessoa: String) -> String {
    return pessoa
}

print(cumprimentarA("Maria"))

//2.

func ehMenor(oPrimeiro: Int, oSegundo: Int) -> Bool {
    if oPrimeiro < oSegundo {
        return true
    } else {
        return false
    }
//    return oPrimeiro < oSegundo
}

print(ehMenor(oPrimeiro: 3, oSegundo: 5))
print(ehMenor(oPrimeiro: 7, oSegundo: 5))
print(ehMenor(oPrimeiro: 10, oSegundo: 10))

// 3.

func ehImparMaiorDoQueDez(umNumero: Int) -> Bool {
//    if umNumero % 2 != 0 { // se for ímpar
//        if umNumero > 10 { // se é maior do que 10
//            return true
//        } else {
//            return false
//        }
//    } else {
//        return false
//    }
    
    if umNumero % 2 != 0 && umNumero > 10 {
        return true
    }
    return false
    
//    return umNumero % 2 != 0 && umNumero > 10
}

print(ehImparMaiorDoQueDez(umNumero: 3))
print(ehImparMaiorDoQueDez(umNumero: 4))
print(ehImparMaiorDoQueDez(umNumero: 13))

// 4.

func imprimirImparesPositivos() {
    var quantidadeDeNumerosImpares = 0
    var numeroInteiroPositivo = 1
    
    while quantidadeDeNumerosImpares != 100 {
        if numeroInteiroPositivo % 2 != 0 { // se for ímpar
            quantidadeDeNumerosImpares = quantidadeDeNumerosImpares + 1
            print(numeroInteiroPositivo)
        }
        numeroInteiroPositivo = numeroInteiroPositivo + 1
    }
    
//    for numeroInteiroPositivo in 1...200 {
//        if numeroInteiroPositivo % 2 != 0 {
//            print(numeroInteiroPositivo)
//        }
//    }
    
}

imprimirImparesPositivos()




