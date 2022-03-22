import UIKit

// 1.
func arrayDiferentes(arrayUm: [Int], arrayDois: [Int]) -> Bool {
    
    guard arrayUm.count == arrayDois.count else { return true }
    
    var saoDiferentes = false
    let quantidadeDeNumerosNosArrays = arrayUm.count
    
    var i = 0
    
    while i < quantidadeDeNumerosNosArrays {
        if arrayUm[i] != arrayDois[i] {
            saoDiferentes = true
            break
        }
        
        i = i + 1
    }
    
    return saoDiferentes
    
}

// 2.

func media(numeros: [Int]) -> Double {
    var soma = 0.0
    let quantidadeDeElementos = numeros.count
    
    for numero in numeros {
        soma = soma + Double(numero)
    }
    
    return soma / Double(quantidadeDeElementos)
}

// 3.

func retornaArrayDeNumerosPares(numeros: [Int]) -> [Int] {
    var arrayNumerosPares: [Int] = []
    
    for numero in numeros {
        if numero % 2 == 0 {
            arrayNumerosPares.append(numero)
        }
    }
    
    return arrayNumerosPares
    
}

// 4.

func retornaSomaDeNumerosPares(numeros: [Int]) -> Int {
    var somaNumerosPares: Int = 0
    
    for numero in numeros {
        if numero % 2 == 0 {
            somaNumerosPares = somaNumerosPares + numero
        }
    }
    
    return somaNumerosPares
}

// 5.

func retornaArrayComDezPrimeirosNumerosNaturais() -> [Int] {
    var arrayNumerosNaturais: [Int] = []
    
    for i in 1...10 {
        arrayNumerosNaturais.append(i)
    }
    
    return arrayNumerosNaturais
}

// 6.

func retornaArrayComCinquentaPrimeirosNumerosNaturais() -> [Int] {
    var arrayNumerosNaturais: [Int] = []
    
    for i in 1...50 {
        arrayNumerosNaturais.append(i)
    }
    
    return arrayNumerosNaturais
}

// 7.

func retornaArrayComDezPrimeirosNumerosNaturaisAPartirDe(numero: Int) -> [Int] {
    var arrayNumerosNaturais: [Int] = []
    
    var contador = 1
    
    while contador <= 10 {
        arrayNumerosNaturais.append(numero + contador)
        contador = contador + 1
    }
    
    return arrayNumerosNaturais
}

// 8.

func retornaArrayDeIntervaloEntreNumeros(a: Int, b: Int) -> [Int] {
    var arrayNumerosNaturais: [Int] = []
    
    var contador = a + 1
    
    while contador < b {
        arrayNumerosNaturais.append(contador)
        contador = contador + 1
    }
    
    return arrayNumerosNaturais
}

// 9.

func resultadosDaRoleta(quantidade: Int) -> [Int] {
    var resultadosDaRoleta: [Int] = []
    
    var contador = 0
    
    while contador < quantidade {
        let valorAleatorio =  Int.random(in: 0..<37)
        resultadosDaRoleta.append(valorAleatorio)
        contador = contador + 1
    }
    
    
    return resultadosDaRoleta
}

// 10.

func inverso(numeros: [Int]) -> [Int] {
    var quantidade = numeros.count - 1
    
    var arrayInverso: [Int] = []
    
    while quantidade >= 0 {
        arrayInverso.append(numeros[quantidade])
        quantidade = quantidade - 1
    }
    
    return arrayInverso
}
