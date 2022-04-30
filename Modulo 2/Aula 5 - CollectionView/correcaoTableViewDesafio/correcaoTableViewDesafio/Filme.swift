//
//  Filme.swift
//  correcaoTableViewDesafio
//
//  Created by Jessica Santana on 29/04/22.
//

import Foundation
import UIKit

class Filme {
    let poster: UIImage
    let titulo: String
    let genero: String
    
    init(poster: UIImage, titulo: String, genero: String) {
        self.poster = poster
        self.titulo = titulo
        self.genero = genero
    }
}
