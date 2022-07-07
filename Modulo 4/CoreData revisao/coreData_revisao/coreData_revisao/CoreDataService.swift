//
//  CoreDataService.swift
//  coreData_revisao
//
//  Created by Jessica Santana on 06/07/22.
//

import Foundation
import UIKit

class CoreDataService {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func adicionarPiadaNoCoreData(piada: Piada) {
        let piadaSalva: PiadaSalva = .init(context: context)
        piadaSalva.id = Int16(piada.id)
        piadaSalva.tipo = piada.tipo
        piadaSalva.categoria = piada.categoria
        piadaSalva.joke = piada.joke
        piadaSalva.setup = piada.setup
        piadaSalva.delivery = piada.delivery
        
        salvarContexto()
    }
    
    func pegarListaDePiadasNoCoreData() -> [PiadaSalva] {
        do {
            return try context.fetch(PiadaSalva.fetchRequest())
        } catch {
            
        }
        
        return []
    }
    
    private func salvarContexto() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        appDelegate.saveContext()
    }
    
}
