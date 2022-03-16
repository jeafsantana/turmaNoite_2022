import UIKit

// 1. Declarar variáveis

var umNumeroA: Int = 3
var umNumeroB: Double = 2.5
var umString: String = "Hello World"

print(umNumeroA)
print(umNumeroB)
print(umString)

// 1a. soma

//let soma = umNumeroA + umNumeroB

var doubleUmNumeroA = Double(umNumeroA)

print(doubleUmNumeroA)

let soma = doubleUmNumeroA + umNumeroB

print(soma)

// 1b. subtração

//let diferenca = umNumeroA - umNumeroB

let intUmNumeroB = Int(umNumeroB)
print(intUmNumeroB)

let diferenca = umNumeroA - intUmNumeroB

print(diferenca)


// -----------------------------------------
print("-----------------------------------------")
// 3.

for numeroNatural in 0...9 {
    let numeroNaturalAoQuadrado = numeroNatural * numeroNatural
//    let numeroNaturalAoQuadrado = pow(numeroNatural, 2)
    print(numeroNaturalAoQuadrado)
}

print("-----------------------------------------")
var somatorio = 0

for (numeroNatural, index) in (0...19).enumerated() {
    if numeroNatural % 2 != 0 { // eh impar
        somatorio = somatorio + (numeroNatural * numeroNatural)
    }
}
print(somatorio)

print("-----------------------------------------")

// 5.

var numeroAleatorio = 1

//while numeroAleatorio != 3 {
//    numeroAleatorio = Int.random(in: 0...5)
//    print(numeroAleatorio)
//}





//func cumprimentar(a pessoa: String) {}
//
//cumprimentarA(pessoa: "João")
//cumprimentar(a: "João")









