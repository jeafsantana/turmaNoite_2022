import UIKit

var valorNumerico: Int?

print(valorNumerico)

print("---------")

valorNumerico = 3

print(valorNumerico)

print("---------")

valorNumerico = nil
var valorNumericoB: Int = 3

print(valorNumerico)

var soma = (valorNumerico ?? 1) + valorNumericoB

print(valorNumerico)

print(soma)

print("---------")

func somaPoupancaEContaCorrente(saldoPoupanca: Double?, saldoContaCorrente: Double?) -> Double {
//    return saldoPoupanca! + saldoContaCorrente!

//    if let saldoPoupancaConstante = saldoPoupanca {
//        if let saldoContaCorrenteConstante = saldoContaCorrente {
//            return saldoPoupancaConstante + saldoContaCorrenteConstante
//        }
//    }
    
    if let saldoPoupancaConstante = saldoPoupanca, // &&
       let saldoContaCorrenteConstante = saldoContaCorrente  {
        return saldoPoupancaConstante + saldoContaCorrenteConstante
    }
    
    
    return 0.0
}

let soma1 = somaPoupancaEContaCorrente(saldoPoupanca: nil, saldoContaCorrente: nil)

print(soma1) //0.0

let soma2 = somaPoupancaEContaCorrente(saldoPoupanca: 3.0, saldoContaCorrente: nil)

print(soma2) //0.0 | 3.0

let soma3 = somaPoupancaEContaCorrente(saldoPoupanca: 3.0, saldoContaCorrente: 3.0)

print(soma3) // 6.0



print("---------")

// somar a + b.
// Se a for nulo ou a soma der um valor abaixo de zero, retorna 0
func somaERetornaValoresAcimaDeZero(a: Int?, b: Int) -> Int {
    guard let aConstante = a else { return 0 }
    
    
    let soma = aConstante + b
    
    if soma < 0 {
        return 0
    } else {
        return soma
    }
}

func somaERetornaValoresAcimaDeZero(a: Int?, b: Int?) -> Int {
//    guard let aConstante = a else { return 0 }
//    guard let bConstante = b else { return 0 }
    
    guard let aConstante = a, // &&
          let bConstante = b
    else { return 0 }
    
    let soma = aConstante + bConstante
    
    if soma < 0 {
        return 0
    } else {
        return soma
    }
}





print("---------")



var dicionario: [String: String] = [:]

dicionario["chave1"] = "valor1"
dicionario["chave2"] = "valor2"
dicionario["chave3"] = "valor3"

print(dicionario)

print("---------")


let chave = "a"

let valorParaChaveDH = dicionario["DH"]
let valorParaChaveChave3 = dicionario["chave3"]


print(valorParaChaveDH)
print(valorParaChaveChave3)


