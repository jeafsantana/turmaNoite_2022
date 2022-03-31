import UIKit

protocol InformacaoEspionagem {
    func anotarInformacaoQueFoiDitaComFulaninho(mensagem: String)
}

class Espiao {
    
    var delegate: InformacaoEspionagem?
    var nome: String?
    
    func falarComFulaninho(mensagem: String) {
        delegate?.anotarInformacaoQueFoiDitaComFulaninho(mensagem: mensagem)
    }
    
}

class Fofoqueira: InformacaoEspionagem {
    func anotarInformacaoQueFoiDitaComFulaninho(mensagem: String) {
        print("Informação anotada pela fofoqueira: \(mensagem)")
    }
    
    func dizerOi() {
        print("oi")
    }
}

let raul = Fofoqueira()

let adriano = Espiao()
adriano.delegate = raul

adriano.falarComFulaninho(mensagem: "a aula de hoje é complexa")



