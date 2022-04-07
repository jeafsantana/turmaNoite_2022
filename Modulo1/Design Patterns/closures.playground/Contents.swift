import UIKit

func fazerTorta(comprouFarinha: String) -> Bool {
    if comprouFarinha == "A filha trouxe farinha" {
        return true
    } else {
        return false
    }
}

var closure: (Int, Int, Int) -> Int = { a, b, c in
    return a + b + c
}

let soma = closure(2,2,2)

print(soma)


//func maeFazendoCoisas(mensagemFilha: (Bool) -> String, aTortaEstaPronta: (String) -> Bool) {
//    print("Realizando açoes")
//
//    let mensagem = mensagemFilha(true)
//
//    if aTortaEstaPronta(mensagem) == true {
//        print("posso comer")
//    } else {
//        print("eu nao posso comer")
//    }
//}
//
//maeFazendoCoisas(mensagemFilha: <#T##(Bool) -> String#>, aTortaEstaPronta: <#T##(String) -> Bool#>)


//func maeFazendoCoisas(mensagemFilha: String, aTortaEstaPronta: (String) -> Bool) {
//    print("Realizando açoes")
//
//    if aTortaEstaPronta(mensagemFilha) == true {
//        print("posso comer")
//    } else {
//        print("eu nao posso comer")
//    }
//}
//
//
//maeFazendoCoisas(mensagemFilha: "Trouxe farinha") { comprouFarinha in
//    if comprouFarinha == "A filha trouxe farinha" {
//        return true
//    } else {
//        return false
//    }
//}

//maeFazendoCoisas { comprouFarinha in
//    if comprouFarinha == "A filha trouxe farinha" {
//        return true
//    } else {
//        return false
//    }
//}



//func requisicaoInstagram(exibirTelaInicial: (Bool) -> String) {
//
//    print("Carregando")
//    print("Faz requisiçao") // 5s
//    print("Carregou.")
//    let respostaDaExibicao = exibirTelaInicial(false)
//    print(respostaDaExibicao)
//
//}
//
//requisicaoInstagram(exibirTelaInicial: { respostaDaRequisicao in
//    if respostaDaRequisicao == true {
//        return "Feed de informaçoes exibido com sucesso!"
//    } else {
//        return "Tela de erro exibida com sucesso!"
//    }
//
//})





func requisicaoInstagram(completion: @escaping (Bool) -> String) {
    let tempoProAdrianoPegarMeusDados = DispatchTime.now() + .seconds(7)
    
    print("Carregando...")
        
    DispatchQueue.main.asyncAfter(deadline: tempoProAdrianoPegarMeusDados) {
        print("Carregou")
        print(completion(true))
    }
    
    print("Estou fazendo altas coisas porque ainda nao deu o tempo")
}

requisicaoInstagram { respostaDaRequisicao in
    if respostaDaRequisicao == true {
        return "Feed de informaçoes exibido com sucesso!"
    } else {
        return "Tela de erro exibida com sucesso!"
    }
}







































