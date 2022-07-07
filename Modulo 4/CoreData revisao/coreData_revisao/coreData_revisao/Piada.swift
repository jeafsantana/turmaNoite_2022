//
//  Piada.swift
//  coreData_revisao
//
//  Created by Jessica Santana on 06/07/22.
//

import Foundation

struct Piada: Codable {
    let categoria: String
    let tipo: String
    let joke: String?
    let setup: String?
    let delivery: String?
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case categoria = "category"
        case tipo = "type"
        case joke
        case setup
        case delivery
        case id
    }
}
