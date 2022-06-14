//
//  Servico.swift
//  aulaNetwork
//
//  Created by Jessica Santana on 13/06/22.
//

import Foundation

class Servico {
    
    func realizarRequisicaoDePiada(completion: @escaping (Piada) -> Void) {
        
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?safe-mode") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            let dic = json as? [String: Any]
//            print("----> \(dic)")
            
            guard let typePiada = dic?["type"] as? String else { return }
            
            let jokePiada = dic?["joke"] as? String
            let setupPiada = dic?["setup"] as? String
            let deliveryPiada = dic?["delivery"] as? String
            
//            print("----> \(typePiada)")
//            print("----> \(jokePiada)")
//            print("----> \(setupPiada)")
//            print("----> \(deliveryPiada)")
            
            
            let piada = Piada(
                type: typePiada,
                joke: jokePiada,
                setup: setupPiada,
                delivery: deliveryPiada
            )
            
            completion(piada)
            
            
            // quando o tipo da piada é single, a chave da piada é joke
            
            // quando o tipo da piada é two part, as chaves da piada sao
            // setup e delivery
            
            
        }
        
        task.resume()
    }
    
}
