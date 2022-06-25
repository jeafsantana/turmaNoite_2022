//
//  CoreDataService.swift
//  aula_CoreData
//
//  Created by Jessica Santana on 24/06/22.
//

import Foundation
import UIKit

class CoreDataService {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func adicionarPessoaNoCoreData(nome: String?, idade: Int16) {
        let pessoa: Pessoa = .init(context: context)
        pessoa.nome = nome
        pessoa.idade = idade
        
        salvarContexto()
    }
    
    func pegarListaDePessoasNoCoreData() -> [Pessoa] {
        do {
            return try context.fetch(Pessoa.fetchRequest())
        } catch {
            print(error)
        }
        
        return []
    }
    
    func removerPessoaNoCoreData(pessoa: Pessoa) {
        context.delete(pessoa)
        salvarContexto()
    }
    
    private func salvarContexto() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
}
