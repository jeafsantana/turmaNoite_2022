//
//  Piada.swift
//  aulaNetwork
//
//  Created by Jessica Santana on 13/06/22.
//

import Foundation

class Piada {
    let type: String
    
    let joke: String?
    let setup: String?
    let delivery: String?
    
    init(type: String, joke: String?, setup: String?, delivery: String?) {
        self.type = type
        self.joke = joke
        self.setup = setup
        self.delivery = delivery
    }
    
}
