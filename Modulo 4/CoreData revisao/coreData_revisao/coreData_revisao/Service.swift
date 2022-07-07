//
//  Service.swift
//  coreData_revisao
//
//  Created by Jessica Santana on 06/07/22.
//

import Foundation
import Alamofire

class Service {
    
    func getPiada(completion: @escaping (Piada) -> Void) {
        AF.request("https://v2.jokeapi.dev/joke/Any?safe-mode").responseDecodable(of: Piada.self) { response in
            let resultadoDaRequisicao = response.result
                        
            switch resultadoDaRequisicao {
                
            case .success(let piada):
                completion(piada)
            case .failure(_):
                break
            }
        }
    }
    
}
